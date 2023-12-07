import ProjectDescription
import ProjectDescriptionHelpers

let project: Project = .previewProject(
  projectName: "MoviePreviews",
  packages: [
    .local(path: "../../../Feature/Movie"),
    .local(path: "../../../Core/Architecture"),
    .local(path: "../../../Core/DesignSystem"),
    .local(path: "../../../Core/Domain"),
    .local(path: "../../../Core/Platform"),
  ],
  dependencies: [
    .package(product: "Movie"),

  ])
