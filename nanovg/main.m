//
//  main.m
//  nanovg
//
//  Created by bianchui on 2021/02/25.
//  Copyright © 2021 bianchui. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#include <mach-o/dyld.h>
const char* getAppPath(void) {
    static char g_path[MAXPATHLEN+1];
    if (g_path[0] == 0) {
        uint32_t size = sizeof(g_path);
        if (_NSGetExecutablePath(g_path, &size) == 0) {
            char* str = strrchr(g_path, '/');
            if (str) {
                str[0] = 0;
            }
        }
    }
    return g_path;
}

const char* getResPath(void) {
    static char g_path[MAXPATHLEN+1];
    if (g_path[0] == 0) {
        strcpy(g_path, getAppPath());
        char* str = strrchr(g_path, '/');
        if (str) {
            str[0] = 0;
            strcpy(str, "/Resources");
        }
    }
    return g_path;
}

const char* mapResPath(const char* res) {
    static char buf[MAXPATHLEN+1];
    char* str = strrchr(res, '/');
    sprintf(buf, "%s/%s", getResPath(), str);
    return buf;
}

#include "../example/example_gl3.c"
