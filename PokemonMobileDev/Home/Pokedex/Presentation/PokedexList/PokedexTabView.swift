import SwiftUI

struct PokedexTabView: View {
    @StateObject var viewModel = PokedexTabViewModel()
  
    

    var body: some View {
        let resource = viewModel.pokemonsResource
        VStack {
            // Search bar
            Search(text: $viewModel.searchText) { value in
                viewModel.search(value)
            }
            Divider()
                .padding(.top, 20)
            if (resource.isInitial || resource.isLoading) && viewModel.currentPokemons.isEmpty {
                LoadingPokemonShimmerList()
            } else if resource.isFailure {
                GenericFailureView(error: resource.failureError)
            } else {
                PokemonListView(viewModel: viewModel)
            }
        }
        .padding(.horizontal, 16)
        .task {
            guard viewModel.currentPokemons.isEmpty else { return }
            await viewModel.getPokemons()
        }
    }
    
}


#Preview {
    PokedexTabView()
}
