//
//  OCSMixedAudio.m
//  Objective-C Sound
//
//  Created by Aurelius Prochazka on 6/28/12.
//  Copyright (c) 2012 Hear For Yourself. All rights reserved.
//
//  Implementation of Csound's ntrpol:
//  http://www.csounds.com/manual/html/ntrpol.html
//

#import "OCSMixedAudio.h"

@interface OCSMixedAudio () {
    OCSAudio *in1;
    OCSAudio *in2;
    OCSConstant *min;
    OCSConstant *max;
    OCSControl *current;
}
@end

@implementation OCSMixedAudio

- (instancetype)initWithSignal1:(OCSAudio *)signal1
                        signal2:(OCSAudio *)signal2
                        balance:(OCSControl *)balancePoint;
{
    self = [super initWithString:[self operationName]];
    if (self) {
        min = ocsp(0.0);
        max = ocsp(1.0);
        current = balancePoint;
        in1 = signal1;
        in2 = signal2;
    }
    return self;
}


- (void)setMinimumBalancePoint:(OCSConstant *)minimumBalancePoint {
    min = minimumBalancePoint;
}
- (void)setMaximumBalancePoint:(OCSConstant *)maximumBalancePoint {
    max = maximumBalancePoint;
}

- (NSString *)stringForCSD {
    return [NSString stringWithFormat:
            @"%@ ntrpol %@, %@, %@, %@, %@",
            self, in1, in2, current, min, max];
}

@end
