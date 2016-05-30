

// 单例声明宏
#define  interfaceSingleton(name)  +(instancetype)share##name

// 单例实现宏

#if __has_feature(objc_arc)
// 是ARC
#define implementationSingleton(name)  \
+ (instancetype)share##name { \
return [[self alloc] init]; \
} \
static id _instance; \
+ (instancetype)allocWithZone:(struct _NSZone *)zone { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \


#else
// 是MRC
#define implementationSingleton(name)  \
+ (instancetype)share##name { \
return [[self alloc] init]; \
} \
static id _instance; \
+ (instancetype)allocWithZone:(struct _NSZone *)zone { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
- (oneway void)release {} \
- (instancetype)retain { \
return _instance; \
} \
- (NSUInteger)retainCount { \
return MAXFLOAT; \
}

#endif




