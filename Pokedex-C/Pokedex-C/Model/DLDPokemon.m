//
//  DLDPokemon.m
//  Pokedex-C
//
//  Created by Deven Day on 9/29/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import "DLDPokemon.h"

@implementation DLDPokemon

- (instancetype)initWithPokemonName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities spritePath:(NSString *)spritePath
{
    self = [super init];
    
    if (self)
    {
        _name = name;
        _identifier = identifier;
        _abilities= abilities;
        _spritePath = spritePath;
    }
    return self;
}

@end

@implementation DLDPokemon (JSONConvertable)

- (DLDPokemon *)initWithDictionary:(NSDictionary<NSString *,id> *)topLevelDictionary
{
    NSString *name = topLevelDictionary[@"name"];
    NSInteger identifier = [topLevelDictionary[@"id"] intValue];
    NSArray *abilitiesArray = topLevelDictionary[@"abilities"];
    NSString *spritePath = topLevelDictionary[@"sprites"][@"font_default"];
    
    if (![name isKindOfClass:[NSString class]] || ![abilitiesArray isKindOfClass:[NSArray class]])
    {
        return nil;
    }
    
    NSMutableArray<NSString *> *abilities = [NSMutableArray new];
    
    for (NSDictionary *dictionary in abilitiesArray)
    {
        NSDictionary *abilityDict = dictionary[@"ability"];
        NSString *abilityName = abilityDict[@"name"];
        [abilities addObject:abilityName];
    }
    
    return [self initWithPokemonName:name identifier:identifier abilities:abilities spritePath:spritePath];
}

@end
