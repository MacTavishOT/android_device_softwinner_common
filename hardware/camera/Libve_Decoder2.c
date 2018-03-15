#include "Libve_Decoder2.h"

#include<android/log.h>
#include <stdio.h>
#include <time.h>
//#include "vdecoder.h"

#define LOG_TAG    "Libev_decorder2"

#define USE_ION_MEM_ALLOCATOR

extern struct ScMemOpsS* MemAdapterGetOpsS();

#if  DBG_ENABLE
     #define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)
     #define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG,LOG_TAG,__VA_ARGS__)
     #define LOGI(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
     #define LOGW(...)  __android_log_print(ANDROID_LOG_WARN,LOG_TAG,__VA_ARGS__)
     #define LOGF(...)  __android_log_print(ANDROID_LOG_FATAL,LOG_TAG,__VA_ARGS__)
     #define LOGV(...)  __android_log_print(ANDROID_LOG_VERBOSE,LOG_TAG,__VA_ARGS__)
#else
     #define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)
     #define LOGD(...)
     #define LOGI(...)
     #define LOGW(...)
     #define LOGF(...)
     #define LOGV(...)
#endif

static int saveframe(char *str,void *p,int length,int is_oneframe)
{  
    FILE *fd;

    if(is_oneframe){
        fd = fopen(str,"wb");
    }
    else{
        fd = fopen(str,"a");
    }

    if(!fd){
        LOGE("Open file error");
        return -1;
    }
    if(fwrite(p,1,length,fd)){
       LOGD("Write file successfully");
       fclose(fd);
       return 0;
    }
    else {
       LOGE("Write file fail");
       fclose(fd);
       return -1;
    }
}

static int GetStreamData(const void* in, char*  buf0, int buf_size0, char* buf1, int buf_size1, VideoStreamDataInfo* dataInfo)
{
    LOGD("Starting get stream data!!");
    if(dataInfo->nLength <= buf_size0) {
            LOGV("The stream lengh is %d, the buf_size0 is %d",data_info->lengh,buf_size0);
            memcpy(buf0, in, dataInfo->nLength);
    }
    else {
        if(dataInfo->nLength <= (buf_size0+buf_size1)){          
            LOGV("The stream lengh is %d, the buf_size0 is %d,the buf_size1 is %d",dataInfo->nLength,buf_size0,buf_size1);
            memcpy(buf0, in, buf_size0);
            memcpy(buf1,((void*)((int)in+buf_size0)),(dataInfo->nLength -buf_size0));
        }
        else
            return -1;
    }
    dataInfo->bIsFirstPart = 1;
    dataInfo->bIsLastPart  = 1;
    dataInfo->pData       = buf0;
    dataInfo->nPts        = -1;
    dataInfo->nPcr        = -1;

    return 0;
}

void Libve_dec2(VideoDecoder** mVideoDecoder, const void *in, void *out, VideoStreamInfo* pVideoInfo, VideoStreamDataInfo* dataInfo, VConfig* pVconfig)
{
    int   ret;
    char* pBuf0;
    char* pBuf1;
    int size0;
    int size1;
    char* pData;

    VideoPicture*     pPicture;

    if(*mVideoDecoder == NULL)
    {
        LOGE("mVideoDecoder = NULL, return");
        return;
    }

    ret = RequestVideoStreamBuffer(*mVideoDecoder, dataInfo->nLength, &pBuf0, &size0, &pBuf1, &size1,0);

    if(ret < 0)
    {
        LOGE("FUNC:%s, LINE:%d, RequestVideoStreamBuffer fail!",__FUNCTION__,__LINE__);
        return;
    }

    GetStreamData(in,pBuf0,size0,pBuf1,size1,dataInfo);

    SubmitVideoStreamData(*mVideoDecoder, dataInfo, 0);

    //* decode stream.
    ret = DecodeVideoStream(*mVideoDecoder, 0 /*eos*/, 0/*key frame only*/, 0/*drop b frame*/, 0/*current time*/);

    if(ret == VDECODE_RESULT_FRAME_DECODED || ret == VDECODE_RESULT_KEYFRAME_DECODED)
    {
        pPicture = RequestPicture(*mVideoDecoder, 0/*the major stream*/);

        if(pPicture)
        {
            pVconfig->memops->flush_cache((void*)pPicture->pData0,
                                  pVideoInfo->nWidth*pVideoInfo->nHeight);
            pVconfig->memops->flush_cache((void*)pPicture->pData1,
                                  pVideoInfo->nWidth*pVideoInfo->nHeight/2);
            memcpy(out, (void*)pPicture->pData0, pVideoInfo->nWidth*pVideoInfo->nHeight);
            memcpy((char*)out + pVideoInfo->nWidth*pVideoInfo->nHeight, (void*)pPicture->pData1, pVideoInfo->nWidth*pVideoInfo->nHeight/2);

            ReturnPicture(*mVideoDecoder, pPicture);
        }
    }
}

int Libve_init2(VideoDecoder** mVideoDecoder, VideoStreamInfo* pVideoInfo, VConfig* pVconfig)
{
    if(*mVideoDecoder != NULL)
    {
        LOGE("FUNC: %s fail, LINE: %d, mVideoDecoder is not NULL, please check it!",__FUNCTION__, __LINE__);
        return -1;
    }

    *mVideoDecoder = CreateVideoDecoder();

    //* initialize the decoder.
    if(InitializeVideoDecoder(*mVideoDecoder, pVideoInfo, pVconfig) != 0)
    {
        LOGE("initialize video decoder fail.");
        DestroyVideoDecoder(*mVideoDecoder);
        *mVideoDecoder = NULL;
        return -1;
    }

    return 0;
}

int Libve_exit2(VideoDecoder** mVideoDecoder)
{
    if(*mVideoDecoder == NULL)
    {
        LOGE("FUNC: %s, LINE: %d, mVideoDecoder == NULL",__FUNCTION__, __LINE__);
        return -1;
    }

    DestroyVideoDecoder(*mVideoDecoder);
    *mVideoDecoder = NULL;

    return 0;
}

