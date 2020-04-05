#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    if (!numbers || !numbers.count){
        return nil;
    } else {
    
    
    
          NSMutableArray *arrayToFormula = [[NSMutableArray alloc] initWithArray:numbers];
          NSMutableArray *arrayWithStrings = [[NSMutableArray alloc] init];
          for (int i=0; i<numbers.count; i++) {
              int checkForMinus = [[arrayToFormula objectAtIndex:i] intValue];
              if (i < (arrayToFormula.count -2)){
                
                  if (checkForMinus>=0) {
                  [arrayWithStrings addObject:[NSString stringWithFormat: @"%@x^%d",[arrayToFormula objectAtIndex:i],arrayToFormula.count-(i+1)]];
                  [arrayWithStrings addObject:[NSString stringWithFormat:@"+"]];
                      if (checkForMinus == 0) {
                          [arrayWithStrings removeLastObject];
                          [arrayWithStrings removeLastObject];
                      }
                      
                  } else {
                      checkForMinus = checkForMinus*(-1);
                      NSUInteger *noMinus = [NSNumber numberWithInt:checkForMinus];
                      [arrayWithStrings removeLastObject];
                    [arrayWithStrings addObject:[NSString stringWithFormat:@"-"]];
                      [arrayWithStrings addObject:[NSString stringWithFormat:@"%@x^%d", noMinus,arrayToFormula.count-(i+1)]];
                      [arrayWithStrings addObject:[NSString stringWithFormat:@"+"]];
                  }
      //Хвост уравнения
              } else {
                  if (checkForMinus>=0) {
                  [arrayWithStrings addObject:[NSString stringWithFormat:@"%@x",[arrayToFormula objectAtIndex:i]]];
                  [arrayWithStrings addObject:[NSString stringWithFormat:@"+"]];
                      
                      if (checkForMinus ==0) {
                          [arrayWithStrings removeLastObject];
                          [arrayWithStrings removeLastObject];
                      }
                      
                      if (checkForMinus ==1) {
                          [arrayWithStrings removeLastObject];
                          [arrayWithStrings removeLastObject];
                          [arrayWithStrings addObject:[NSString stringWithFormat:@"x"]];
                          [arrayWithStrings addObject:[NSString stringWithFormat:@"+"]];
                      }
                      
                  int lastObjectCheckForMinus = [[arrayToFormula lastObject] intValue];
                      if (lastObjectCheckForMinus>=0) {
                  [arrayWithStrings addObject:[NSString stringWithFormat:@"%@", [arrayToFormula lastObject]]];
                          if (lastObjectCheckForMinus ==0) {
                              [arrayWithStrings removeLastObject];
                              [arrayWithStrings removeLastObject];
                          }
                          
                      } else {
                          [arrayWithStrings removeLastObject];
                          [arrayWithStrings addObject:[NSString stringWithFormat:@"-"]];
                          lastObjectCheckForMinus = lastObjectCheckForMinus*(-1);
                          NSInteger *noMinusInLastObject = [NSNumber numberWithInt:lastObjectCheckForMinus];
                           [arrayWithStrings addObject:[NSString stringWithFormat:@"%@", noMinusInLastObject]];
                                }
                  break;
    //если минус в хвосте
                  } else{
                      checkForMinus = checkForMinus*(-1);
                      NSUInteger *noMinus = [NSNumber numberWithInt:checkForMinus];
                      [arrayWithStrings removeLastObject];
                      [arrayWithStrings addObject:[NSString stringWithFormat:@"-"]];
                      [arrayWithStrings addObject:[NSString stringWithFormat:@"%@x",noMinus]];
                      
                      if (checkForMinus ==1) {
                          [arrayWithStrings removeLastObject];
                          [arrayWithStrings addObject:[NSString stringWithFormat:@"x"]];
                      }
                      
                      [arrayWithStrings addObject:[NSString stringWithFormat:@"+"]];
                      
                      
                      int lastObjectCheckForMinus = [[arrayToFormula lastObject] intValue];
                      if (lastObjectCheckForMinus>=0) {
                      [arrayWithStrings addObject:[NSString stringWithFormat:@"%@", [arrayToFormula lastObject]]];
                      } else {
                          [arrayWithStrings removeLastObject];
                          [arrayWithStrings addObject:[NSString stringWithFormat:@"-"]];
                          lastObjectCheckForMinus = lastObjectCheckForMinus*(-1);
                          NSInteger *noMinusInLastObject = [NSNumber numberWithInt:lastObjectCheckForMinus];
                           [arrayWithStrings addObject:[NSString stringWithFormat:@"%@", noMinusInLastObject]];
                      }
                      
                      break;
                  }
              }
          }
        
         
          NSString *answer = [arrayWithStrings componentsJoinedByString:@" "];
    
    
        return answer;
    } 
}
@end
