//
//  PokemonDetails.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 28/01/25.
//

import SwiftUI

struct PokemonDetails: View {
    var pokemonId: Int
    @StateObject var viewModel: PokemonDetailsViewModel =
    PokemonDetailsViewModel()

    var body: some View {
        GeometryReader { geo in
            switch viewModel.pokemonResponse {
            case .initial, .loading:
                VStack {
                    GenericLoading(loadingMessage: "Loading Details...")
                    PokemonWithType(pokemonImage: "")
                }
            case .failure(let error):
                GenericFailureView(error: error)
            case .success(let pokemon):
                let firstType = pokemon.types.first?.pokemonType
                ScrollView {
                    ZStack(alignment: .top) {
                        PokemonDetailsHeader(
                            screenWidth: geo.size.width,
                            screenHeight: geo.size.height,
                            pokemonType: firstType ?? .all,
                            pokemonImage: pokemon.sprites.frontDefault,
                            pokemonSize: geo.size.height * 0.25
                        )
                        .frame(width: geo.size.width, height: geo.size.height)
                        .offset(y: -geo.size.height * 0.7)
                        VStack(alignment: .leading) {
                            Text(pokemon.name)
                                .font(.system(size: 32, weight: .medium))
                                .padding(.top, geo.size.height * 0.25)
                            Text("Nº \(pokemon.id.getThreeDigits)")
                                .font(.system(size: 16, weight: .medium))
                            HStack {
                                ForEach(pokemon.types, id: \.slot) { type in
                                    PokemonTypeContainer(
                                        type: type.pokemonType!
                                    )
                                }
                            }
                            Divider()
                                .padding(.vertical, 20)
                            HStack(spacing: 20) {
                                TextIconWithOutlinedContainer(
                                    icon: "scalemass", title: "weight",
                                    value: "\(pokemon.weight) kg")
                                TextIconWithOutlinedContainer(
                                    icon: "chevron.up.2", title: "height",
                                    value: "\(pokemon.height) m")
                            }
                            Text("Sprites")
                                .font(.system(size: 18, weight: .medium))
                                .padding(.top, 20)
                            let columns = [
                                GridItem(.fixed(120)), GridItem(.fixed(120)),
                                GridItem(.fixed(120)),
                            ]
                            LazyVGrid(columns: columns) {
                                PokemonWithType(
                                    pokemonType: firstType,
                                    pokemonImage: pokemon.sprites.backDefault,
                                    pokemonBottomTitle: "Back Default")
                                if pokemon.sprites.frontShiny != nil {
                                    PokemonWithType(
                                        pokemonType: firstType,
                                        pokemonImage: pokemon.sprites.frontShiny!,
                                        pokemonBottomTitle: "Front Shiny")
                                }
                                if pokemon.sprites.backShiny != nil {
                                    PokemonWithType(
                                        pokemonType: firstType,
                                        pokemonImage: pokemon.sprites.backShiny!,
                                        pokemonBottomTitle: "Back Shiny")
                                }
                                if pokemon.sprites.frontFemale != nil {
                                    PokemonWithType(
                                        pokemonType: firstType,
                                        pokemonImage: pokemon.sprites.frontFemale!,
                                        pokemonBottomTitle: "Front Female")
                                }
                                if pokemon.sprites.backFemale != nil {
                                    PokemonWithType(
                                        pokemonType: firstType,
                                        pokemonImage: pokemon.sprites.backFemale!,
                                        pokemonBottomTitle: "Back Female")
                                }

                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            }
                            AudioPlayerView(
                                url: pokemon.cries.latest, title: "Cries"
                            )
                            .padding(.top, 40)

                        }
                        .padding(.horizontal, 16)
                    }

                }
            }
           

        }
        .task {
          await viewModel.fetchPokemon(id: pokemonId)
        }
        .customArrowBack()
    }
}

#Preview {
    PokemonDetails(
        pokemonId: 1)
}
