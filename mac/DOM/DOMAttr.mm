/*
 * Copyright (C) 2004-2016 Apple Inc. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE INC. ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL APPLE INC. OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "DOMAttrInternal.h"

#import <WebCore/Attr.h>
#import <WebCore/CSSStyleDeclaration.h>
#import "DOMCSSStyleDeclarationInternal.h"
#import "DOMElementInternal.h"
#import "DOMNodeInternal.h"
#import <WebCore/Element.h>
#import "ExceptionHandlers.h"
#import <WebCore/JSMainThreadExecState.h>
#import <WebCore/StyleProperties.h>
#import <WebCore/ThreadCheck.h>
#import <WebCore/URL.h>
#import <WebCore/WebScriptObjectPrivate.h>
#import <wtf/GetPtr.h>

#define IMPL static_cast<WebCore::Attr*>(reinterpret_cast<WebCore::Node*>(_internal))

@implementation DOMAttr

- (NSString *)name
{
    WebCore::JSMainThreadNullState state;
    return IMPL->name();
}

- (BOOL)specified
{
    WebCore::JSMainThreadNullState state;
    return IMPL->specified();
}

- (NSString *)value
{
    WebCore::JSMainThreadNullState state;
    return IMPL->valueForBindings();
}

- (void)setValue:(NSString *)newValue
{
    WebCore::JSMainThreadNullState state;
    IMPL->setValueForBindings(newValue);
}

- (DOMElement *)ownerElement
{
    WebCore::JSMainThreadNullState state;
    return kit(WTF::getPtr(IMPL->ownerElement()));
}

- (BOOL)isId
{
    WebCore::JSMainThreadNullState state;
    return IMPL->isId();
}

- (DOMCSSStyleDeclaration *)style
{
    WebCore::JSMainThreadNullState state;
    return kit(WTF::getPtr(IMPL->style()));
}

@end

WebCore::Attr* core(DOMAttr *wrapper)
{
    return wrapper ? reinterpret_cast<WebCore::Attr*>(wrapper->_internal) : 0;
}

DOMAttr *kit(WebCore::Attr* value)
{
    WebCoreThreadViolationCheckRoundOne();
    return static_cast<DOMAttr*>(kit(static_cast<WebCore::Node*>(value)));
}
