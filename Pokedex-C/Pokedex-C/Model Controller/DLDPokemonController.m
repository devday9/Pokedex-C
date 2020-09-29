//
//  DLDPokemonController.m
//  Pokedex-C
//
//  Created by Deven Day on 9/29/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import "DLDPokemonController.h"

@implementation DLDPokemonController

static NSString * const baseURLString = @"https://pokeapi.co/api/v2";
static NSString * const pokemonEndpoint = @"pokemon";

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(DLDPokemon *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *pokemonURL = [baseURL URLByAppendingPathComponent:pokemonEndpoint];
    NSURL *finalURL = [pokemonURL URLByAppendingPathComponent:searchTerm];
    NSLog(@"%@", finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
        if (error)
        {
            NSLog(@"There was an error: %@, %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"There appears to be no data.");
            completion(nil);
            return;
        }
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
            
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing the JSON: %@", error);
                completion(nil);
                return;
            }
            
            DLDPokemon *pokemon = [[DLDPokemon alloc] initWithDictionary:topLevelDictionary];
            completion(pokemon);
        
    }] resume];
}

+ (void)fetchImageForPokemon:(DLDPokemon *)pokemon completion:(void (^)(UIImage *))completion
{
    NSURL *imageURL = [NSURL URLWithString:pokemon.spritePath];
    NSLog(@"%@", imageURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
               
        if (error)
        {
            NSLog(@"There was an error fetching the image: %@, %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"There was no data found for our image");
            completion(nil);
            return;
        }
        
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
        
    }] resume];
}

@end
