//
//  DLDPokemon.h
//  Pokedex-C
//
//  Created by Deven Day on 9/29/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLDPokemon : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;
@property (nonatomic, copy, readonly) NSString *spritePath;

//1     2                 3            4      5  6
- (instancetype)initWithPokemonName:(NSString *)name
//                           7          8          9
                         identifier:(NSInteger)identifier
//                            10       11      12    13 14   15
                          abilities:(NSArray<NSString *>*)abilities
//                            16        17    18    19    20
                         spritePath:(NSString *)spritePath;

// 1) Declares this function is an instance method
// 2) Return type -> instanceType is shorthand for our class type in this case DLDPokemon
// 3) Function name + first parameters external name
// 4) 1st Parameter Type
// 5) 1st parameter types pointer
// 6) 1st parameters internal name
// 7) 2nd parameters external name
// 8) 2nd parameters type (no pointer required, as it is a primetive)
// 9) 2nd Parameter internal name
// 10) 3rd Parameters external name
// 11) 3rd parameters type
// 12) The type for the content objects of the 3rd parameter type
// 13) Pointer for the objects in the array
// 14) Pointer for the 3rd parameter type
// 15) 3rd parameter internal name
// 16) 4th Parameter external name
// 17) 4th parameter type
// 18) 4th parameter types pointer
// 19) 4th parameters internal name
// 20) Semi-colon

@end

@interface DLDPokemon (JSONConvertable)

- (DLDPokemon *)initWithDictionary:(NSDictionary<NSString *, id>*)topLevelDictionary;

@end

NS_ASSUME_NONNULL_END
