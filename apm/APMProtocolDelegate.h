//
//  APMProtocolDelegate.h
//  apm
//
//  Created by Steve Henderson on 2016-09-30.
//  Copyright © 2016 Steve Henderson. All rights reserved.
//

#ifndef APMProtocolDelegate_h
#define APMProtocolDelegate_h

@protocol APMProtocolDelegate <NSObject>
-(void)apmHasUpdated:(NSString *)updatedApm;
@end

#endif /* APMProtocolDelegate_h */
