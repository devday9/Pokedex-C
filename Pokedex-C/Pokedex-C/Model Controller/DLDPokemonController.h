//
//  DLDPokemonController.h
//  Pokedex-C
//
//  Created by Deven Day on 9/29/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import "DLDPokemon.h"
#import <UIKit/UIKit.h>


@interface DLDPokemonController : NSObject

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm
                       completion: (void (^) (DLDPokemon *))completion;

+ (void)fetchImageForPokemon:(DLDPokemon *)pokemon
                  completion: (void (^) (UIImage *))completion;

@end

