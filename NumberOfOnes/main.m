//
//  main.m
//  NumberOfOnes


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *line = @"12";
        
        NSInteger lineInt = [line integerValue];
        
        NSMutableArray *solutionArray = [[NSMutableArray alloc]init];
        
        NSInteger powerOfTwo = 0;
        NSInteger powerOfTwoSum = 1;
        
        //find out how many bits needed
        while (powerOfTwoSum < lineInt) {
            powerOfTwo ++;
            
            NSInteger tempPowTwo = 1;
            NSInteger i = 0;
            for (i = 0; i < powerOfTwo; i++) {
                tempPowTwo *= 2;
            }
            powerOfTwoSum += tempPowTwo;
            NSLog(@"powerOfTwoSum: %ld", powerOfTwoSum);
        }
        
        NSLog(@"powerOfTwo: %ld", powerOfTwo);
        
        // build bit number
        NSInteger numberOfBitDigits = powerOfTwo + 1;
        NSInteger j = 0;
        for (j = numberOfBitDigits; j > 0; j--) {
           
            NSInteger tempPowTwo = 1;
            NSInteger i = 0;
            for (i = 0; i < powerOfTwo; i++) {
                tempPowTwo *= 2;
            }
            NSLog(@"tempPowTwo: %ld", tempPowTwo);
            powerOfTwo --;
            
            if (lineInt >= tempPowTwo) {
                [solutionArray addObject:@"1"];
                lineInt -= tempPowTwo;
            }
            else {
                [solutionArray addObject:@"0"];
            }
            NSLog(@"lineInt: %ld", lineInt);
        }
        NSLog(@"solutionArray: %@", solutionArray);
        
        // check how many @"1"s
        NSInteger beforeCount = solutionArray.count;
        [solutionArray removeObject:@"1"];
        NSInteger afterCount = solutionArray.count;
        
        NSLog(@"number of one's = %ld", beforeCount - afterCount);
        
    }
    return 0;
}
