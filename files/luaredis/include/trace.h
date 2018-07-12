#ifndef _GE_TRACE_H_
#define _GE_TRACE_H_

#ifdef __cplusplus
extern "C" {
#endif

#ifdef ENABLE_TRACE
#define TRACE TraceOut("Trace at File:%s Line:%d\n",__FILE__,__LINE__)
#define TRACE_INIT TraceInit()
#define TRACE_CLOSE TraceClose()
#define TRACE_OUT TraceOut
#else
#define TRACE 
#define TRACE_INIT 
#define TRACE_CLOSE 
static void dummy(char* format,...){}
#define TRACE_OUT dummy
#endif
#ifdef TRACE_DLL
#define TRACE_API __declspec(dllexport)
#else
#define TRACE_API __declspec(dllimport)
#endif
TRACE_API int TraceInit();
TRACE_API	int TraceClose();
TRACE_API int TraceOut(char* format,...);

#ifdef __cplusplus
}
#endif

#endif
