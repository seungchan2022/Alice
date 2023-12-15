import DesignSystem
import SwiftUI
import ComposableArchitecture
import Domain
import Architecture

struct MovieDetailPage {
  private let store: StoreOf<MovieDetailStore>
  @ObservedObject private var viewStore: ViewStoreOf<MovieDetailStore>
  
  init(store: StoreOf<MovieDetailStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
  
  @State private var isToggled = false
}

extension MovieDetailPage {
  private var tabNavigationComponentViewState: TabNavigationComponent.ViewState {
    .init(activeMatchPath: Link.Movie.Path.movieHome.rawValue)
  }
  
  private var itemComponentViewState: ItemComponent.ViewState {
    .init(
      id: 10,
      poster: DesignSystemImage.image.image,
      releaseDate: "2023-12-06",
      runTime: 117,
      status: "Released",
      productionCountryItemList: [
        .init(name: "United Kingdom"),
        .init(name: "United States of America"),
      ],
      voteAverage: 7.206,
      voteCount: 155,
      genreItemList: [
        .init(id: 35, name: "Comedy"),
        .init(id: 10751, name: "Family"),
        .init(id: 14, name: "Fantasy"),
      ]
    )
  }
  
  private var reviewComponentViewState: ReviewComponent.ViewState {
    .init(id: 787699, itemListCount: 2)
  }
  
  private var overviewComponentViewState: OverviewComponent.ViewState {
    .init(overview: "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.")
  }
    
  private var keywordListComponentViewState: KeywordListComponent.ViewState {
    .init(keywordBucket: [
      .init(keywordItemList: [
        .init(id: 715, name: "chocolate"),
        .init(id: 4344, name: "musical"),
        .init(id: 9765, name: "preqvel"),
      ])
    ])
  }
  
  private var castListComponentViewState: CastListComponent.ViewState {
    .init(castList: [
      .init(
        id: 21,
        profileImage: DesignSystemImage.image.image,
        name: "Chalamet",
        character: "Willy"),
      .init(
        id: 22,
        profileImage: DesignSystemImage.image.image,
        name: "Calah",
        character: "Noodle"),
      .init(
        id: 23,
        profileImage: DesignSystemImage.image.image,
        name: "Hugh",
        character: "Oompa"),
      .init(
        id: 24,
        profileImage: DesignSystemImage.image.image,
        name: "Mathew",
        character: "Ficklegruber"),
      .init(
        id: 25,
        profileImage: DesignSystemImage.image.image,
        name: "Jim",
        character:
      "Abacus"),
    ])
  }
  
  private var crewListComponentViewState: CrewListComponent.ViewState {
    .init(CrewList: [
      .init(
        id: 31,
        profileImage: DesignSystemImage.image.image,
        name: "Calah",
        department: "Acting"),
      .init(
        id: 32,
        profileImage: DesignSystemImage.image.image,
        name: "Keegan",
        department: "Acting"),
      .init(
        id: 33,
        profileImage: DesignSystemImage.image.image,
        name: "Oliva",
        department: "Acting"),
      .init(
        id: 34,
        profileImage: DesignSystemImage.image.image,
        name: "Rowan",
        department: "Acting"),
      .init(
        id: 35,
        profileImage: DesignSystemImage.image.image,
        name: "Hugh",
        department: "Acting"),
    ])
  }
}

extension MovieDetailPage: View {
  var body: some View {
    ZStack {
      DesignSystemColor.label(.gray).color.opacity(0.1)
        .ignoresSafeArea(.all, edges: .all)
      
      VStack {
        DesignSystemNavigation(
          barItem: .init(
            title: "Selected Movie Title",
            backAction: {
              print("back")
              viewStore.send(.routeToBack)
            },
            moreActionList: [
              .init(image: DesignSystemIcon.plus.image, action: { })
            ]),
          title: "Selected Movie Title") {
            
            // ~ Overview
            VStack {
              
              // item
              ItemComponent(viewState: itemComponentViewState)
              
              VStack(alignment: .leading) {
                // list 버튼들
                HStack {
                  Button(action: {  }) {
                    HStack(spacing: 2) {
                      DesignSystemIcon.heart.image
                      Text("WishList")
                    }
                    .padding(4)
                    .overlay(
                      RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 1)
                    )
                    .background {
                      RoundedRectangle(cornerRadius: 5)
                        .fill(DesignSystemColor.system(.white).color)
                    }
                  }
                  .foregroundStyle(DesignSystemColor.tint(.red).color)
                  
                  Button(action: {  }) {
                    HStack(spacing: 2) {
                      DesignSystemIcon.eye.image
                      Text("SeenList")
                    }
                    .padding(4)
                    .overlay(
                      RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 1)
                    )
                    .background {
                      RoundedRectangle(cornerRadius: 5)
                        .fill(DesignSystemColor.system(.white).color)
                    }
                  }
                  .foregroundStyle(DesignSystemColor.tint(.green).color)
                  
                  Button(action: {  }) {
                    HStack(spacing: 2) {
                      DesignSystemIcon.pin.image
                      Text("List")
                    }
                    .padding(4)
                    .overlay(
                      RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 1)
                    )
                    .background {
                      RoundedRectangle(cornerRadius: 5)
                        .fill(DesignSystemColor.system(.white).color)
                    }
                  }
                  .foregroundStyle(DesignSystemColor.label(.ocher).color)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                
                Divider()
                  .padding(.leading, 32)
                
                // 리뷰
                ReviewComponent(
                  viewState: reviewComponentViewState,
                  tapAction: { print("Tapped Reviw") })
                
                Divider()
                  .padding(.leading, 16)
                
                // 오버뷰
                OverviewComponent(viewState: overviewComponentViewState)
              }
            }
            
            .frame(maxWidth: .infinity)
            .background(DesignSystemColor.system(.white).color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // Keywords ~
            VStack {
              
              // keywords
              KeywordListComponent(viewState: keywordListComponentViewState)
              
              Divider()
                .padding(.leading, 16)
              
                
              // cast              
              CastListComponent(viewState: castListComponentViewState)

              Divider()
                .padding(.leading, 16)

              // Director
              HStack {
                Text("Director: ")

                Text("Director's Name")
                  .foregroundStyle(DesignSystemColor.label(.gray).color)

                Spacer()

                DesignSystemIcon.arrow.image
                  .resizable()
                  .frame(width: 6, height: 8)
              }
              .padding(.horizontal, 16)
              .padding(.vertical, 4)

              Divider()
                .padding(.leading, 16)

              // Crew
              CrewListComponent(viewState: crewListComponentViewState)

              Divider()
                .padding(.leading, 16)

              // Similar Movies
              VStack {
                HStack {
                  Text("Similar Movies")

                  Text("See all")
                    .foregroundStyle(DesignSystemColor.label(.greenSlate).color)

                  Spacer()

                  DesignSystemIcon.arrow.image
                    .resizable()
                    .frame(width: 6, height: 8)
                }

                ScrollView(.horizontal) {
                  LazyHStack(spacing: 12) {
                    ForEach(0..<5) { _ in
                      VStack {
                        DesignSystemImage.image.image
                          .resizable()
                          .frame(width: 80, height: 120)
                          .overlay(
                            RoundedRectangle(cornerRadius: 10)
                              .stroke(lineWidth: 1)
                          )

                        Text("Similar Movie Namedddd")

                        Text("68 %")

                      }
                      .lineLimit(0)
                      .frame(width: 100)
                    }
                  }
                }
                .scrollIndicators(.hidden)
              }
              .padding(.horizontal, 16)
              .padding(.vertical, 8)

              Divider()
                .padding(.leading, 16)

              // Recommended Movies
              VStack {
                HStack {
                  Text("Recommended Movies")

                  Text("See all")
                    .foregroundStyle(DesignSystemColor.label(.greenSlate).color)

                  Spacer()

                  DesignSystemIcon.arrow.image
                    .resizable()
                    .frame(width: 6, height: 8)
                }

                ScrollView(.horizontal) {
                  LazyHStack(spacing: 12) {
                    ForEach(0..<5) { _ in
                      VStack {
                        DesignSystemImage.image.image
                          .resizable()
                          .frame(width: 80, height: 120)
                          .overlay(
                            RoundedRectangle(cornerRadius: 10)
                              .stroke(lineWidth: 1)
                          )

                        Text("Recommended Movie Namedddd")

                        Text("68 %")

                      }
                      .lineLimit(0)
                      .frame(width: 100)
                    }
                  }
                }
                .scrollIndicators(.hidden)
              }
              .padding(.horizontal, 16)
              .padding(.vertical, 8)

              Divider()
                .padding(.leading, 16)

              // Other posters
              VStack(alignment: .leading) {
                Text("Other Posters")
                ScrollView(.horizontal) {
                  LazyHStack(spacing: 24) {
                    ForEach(0..<5) { _ in

                      DesignSystemImage.image.image
                        .resizable()
                        .frame(width: 80, height: 120)
                        .overlay(
                          RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                        )
                    }
                  }
                }
                .scrollIndicators(.hidden)
              }
              .padding(.horizontal, 16)
              .padding(.vertical, 8)
              .frame(maxWidth: .infinity)

              Divider()
                .padding(.leading, 16)

              // Images
              VStack(alignment: .leading) {
                Text("Images")
                ScrollView(.horizontal) {
                  LazyHStack(spacing: 16) {
                    ForEach(0..<5) { _ in

                      DesignSystemImage.image.image
                        .resizable()
                        .frame(width: 200, height: 120)
                        .overlay(
                          Rectangle()
                            .stroke(lineWidth: 2)
                        )
                    }
                  }
                }
                .scrollIndicators(.hidden)
              }
              .padding(.horizontal, 16)
              .padding(.vertical, 8)
              .frame(maxWidth: .infinity)
            }
            
            .frame(maxWidth: .infinity)
            .background(DesignSystemColor.system(.white).color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.top, 24)
          }
        
        TabNavigationComponent(
          viewState: tabNavigationComponentViewState,
          tapAction: { viewStore.send(.routeToTabBarItem($0))})
      }
    }
    .navigationTitle("")
    .toolbar(.hidden, for: .navigationBar)
    .ignoresSafeArea(.all, edges: .bottom)
  }
}
