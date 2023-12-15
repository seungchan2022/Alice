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
              VStack(alignment: .leading, spacing: 8) {
                
                HStack(spacing: 12) {
                  DesignSystemImage.image.image
                    .resizable()
                    .frame(width: 80, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                      RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                    }
                  
                  VStack(alignment: .leading, spacing: 4) {
                    HStack {
                      Text("2023 • ")
                      
                      Text("116 minutes • ")
                      
                      Text("Released")
                    }
                    .font(.system(size: 16))
                    
                    Text("China")
                      .font(.system(size: 16))
                    
                    HStack(spacing: 12) {
                      
                      Text("69%")
                        .font(.system(size: 14))
                      
                      Text("1,726 ratings")
                        .font(.system(size: 18))
                    }
                    .padding(.top, 8)
                  }
                  .foregroundStyle(DesignSystemColor.system(.white).color)
                }
                
                ScrollView(.horizontal) {
                  LazyHStack {
                    ForEach(0..<5) { _ in
                      Button(action: { }) {
                        HStack {
                          
                          Text("장르")
                          
                          DesignSystemIcon.arrow.image
                            .resizable()
                            .frame(width: 6, height: 8)
                        }
                        .foregroundStyle(DesignSystemColor.system(.black).color)
                      }
                      .tint(DesignSystemColor.system(.white).color)
                      .buttonStyle(.borderedProminent)
                      .buttonBorderShape(.capsule)
                      .controlSize(.small)
                    }
                  }
                  .padding(.vertical, 8)
                } // 장르
                .scrollIndicators(.hidden)
              } // 맨 위 부분
              .padding(.horizontal, 16)
              .padding(.vertical, 16)
              .frame(maxWidth: .infinity)
              .background(.black.opacity(0.2))
              
              
              VStack(alignment: .leading) {
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
                
                HStack {
                  Text("3 reviews")
                    .foregroundStyle(DesignSystemColor.label(.greenSlate).color)
                  
                  Spacer()
                  
                  DesignSystemIcon.arrow.image
                    .resizable()
                    .frame(width: 6, height: 8)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
                
                Divider()
                  .padding(.leading, 16)
                
                VStack(alignment: .leading, spacing: 8) {
                  Text("Overview")
                    .font(.system(size: 16, weight: .bold))
                  
                  Text("kkdkdkkdkdkdkdk")
                    .foregroundStyle(DesignSystemColor.label(.gray).color)
                  
                  Button(action: { }) {
                    Text("Read More")
                      .foregroundStyle(DesignSystemColor.label(.greenSlate).color)
                  }
                }
                .padding(.top, 4)
                .padding(.bottom, 12)
                .padding(.horizontal, 16)
              }
            } // 전체 VStack
            
            .frame(maxWidth: .infinity)
            .background(DesignSystemColor.system(.white).color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // Keywords ~
            VStack {
              
              // keywords
              VStack(alignment: .leading) {
                Text("Keywords")
                
                ScrollView(.horizontal) {
                  LazyHStack {
                    ForEach(0..<10) { _ in
                      Button(action: { }) {
                        HStack {
                          Text("keyword")
                          
                          DesignSystemIcon.arrow.image
                            .resizable()
                            .frame(width: 6, height: 8)
                        }
                        .foregroundStyle(DesignSystemColor.system(.black).color)
                      }
                      .buttonStyle(.bordered)
                      .buttonBorderShape(.capsule)
                      .controlSize(.small)
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
              
              // cast
              VStack {
                HStack {
                  Text("Cast")
                  
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
                          .frame(width: 60, height: 100)
                          .overlay(
                            RoundedRectangle(cornerRadius: 10)
                              .stroke(lineWidth: 1)
                          )
                        
                        Text("Cast's Name Cast's Name")
                        
                        Text("Character")
                          .foregroundStyle(DesignSystemColor.label(.gray).color)
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
              VStack {
                HStack {
                  Text("Crew")
                  
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
                          .frame(width: 60, height: 100)
                          .overlay(
                            RoundedRectangle(cornerRadius: 10)
                              .stroke(lineWidth: 1)
                          )
                        
                        Text("Crew's Name")
                        
                        Text("Character")
                          .foregroundStyle(DesignSystemColor.label(.gray).color)
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
