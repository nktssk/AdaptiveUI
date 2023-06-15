//
//  CollectionViewScreenBuilder.swift
//  AdaptiveUI-Example
//
//  Created by Nikita Sosyuk on 15.04.2023.
//

import AdaptiveUI
import Darwin

struct CollectionViewScreenBuilder: ConfigurationBuilderProtocol {
    
    static var cache: Bool { true }
    
    static var layout: [AUIConstraint] = [
        .generate { constraint in
            constraint.target = "TableView"
            constraint.targetAnchor = .top
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .top
                config.constant = 10
            })
        },
        .generate { constraint in
            constraint.target = "TableView"
            constraint.targetAnchor = .height
            constraint.kind = .constant(value: 300)
        },
        .generate { constraint in
            constraint.target = "TableView"
            constraint.targetAnchor = .leading
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .leading
            })
        },
        .generate { constraint in
            constraint.target = "TableView"
            constraint.targetAnchor = .trailing
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .trailing
            })
        }
    ]

    static var views: [ViewConfiguration] { [
        .collectionView(
            configuration: .generate() { collectionView in
                collectionView.layout = .generate() {
                    $0.scrollDirection = .horizontal
                    $0.itemSize = .init(width: 400, height: 250)
                    $0.minimumInteritemSpacing = 30
                    $0.minimumLineSpacing = 40
                    $0.estimatedItemSize = .init(width: 400, height: 250)
                }
                collectionView.identifier = "TableView"
                collectionView.data = [
                    .generate() { cell in
                        cell.cellType = "City"
                        cell.selectActionId = "openRublePayment"
                        cell.identifierToData = [
                            "label": .text(content: "Казань"),
                            "image": .image(url: "https://rugor.ru/images/sights/novgorod/v_nvogorod_kreml.jpg"),
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "City"
                        cell.identifierToData = [
                            "label": .text(content: "Москва", actionId: "print"),
                            "image": .image(url: "https://rugor.ru/images/sights/novgorod/v_nvogorod_kreml.jpg"),
                            "backgroundColor": .backgroundColor(generateRandomColor())
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "City"
                        cell.identifierToData = [
                            "label": .text(content: "Санкт-Петербург"),
                            "image": .image(url: "https://rugor.ru/images/sights/novgorod/v_nvogorod_kreml.jpg"),
                            "backgroundColor": .backgroundColor(generateRandomColor())
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "City"
                        cell.identifierToData = [
                            "label": .text(content: "Набережные Челны"),
                            "image": .image(url: "https://rugor.ru/images/sights/novgorod/v_nvogorod_kreml.jpg"),
                            "backgroundColor": .backgroundColor(generateRandomColor())
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "City"
                        cell.identifierToData = [
                            "label": .text(content: "Нижний Новгород"),
                            "image": .image(url: "https://rugor.ru/images/sights/novgorod/v_nvogorod_kreml.jpg"),
                            "backgroundColor": .backgroundColor(generateRandomColor())
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "City"
                        cell.identifierToData = [
                            "label": .text(content: "Великий Новгород"),
                            "image": .image(url: "https://rugor.ru/images/sights/novgorod/v_nvogorod_kreml.jpg"),
                            "backgroundColor": .backgroundColor(generateRandomColor())
                        ]
                    }
                ]
                collectionView.cellsTypes = [
                    "City": AUIViewCell.generate() { view in
                        view.identifier = "City"
                        view.cornerRadius = 20
                        view.subviews = [
                            .label(configuration: .generate() { label in
                                label.identifier = "label"
                                label.text.fontSize = 15
                                label.text.fontWeight = .medium
                            }),
                            .imageView(configuration: .generate() { imageView in
                                imageView.identifier = "image"
                                imageView.cornerRadius = 20
                            })
                        ]
                        view.layout = [
                            .generate { constraint in
                                constraint.target = "label"
                                constraint.targetAnchor = .top
                                constraint.kind = .relation(configuration: .generate { config in
                                    config.sourceAnchor = .top
                                    config.constant = 20
                                })
                            },
                            .generate { constraint in
                                constraint.target = "label"
                                constraint.targetAnchor = .centerX
                                constraint.kind = .relation(configuration: .generate { config in
                                    config.sourceAnchor = .centerX
                                })
                            },
                            .generate { constraint in
                                constraint.target = "image"
                                constraint.targetAnchor = .centerX
                                constraint.kind = .relation(configuration: .generate { config in
                                    config.sourceAnchor = .centerX
                                })
                            },
                            .generate { constraint in
                                constraint.target = "image"
                                constraint.targetAnchor = .top
                                constraint.kind = .relation(configuration: .generate { config in
                                    config.sourceAnchor = .bottom
                                    config.source = "label"
                                    config.constant = 20
                                })
                            },
                            .generate { constraint in
                                constraint.target = "image"
                                constraint.targetAnchor = .height
                                constraint.kind = .constant(value: 180)
                            },
                            .generate { constraint in
                                constraint.target = "image"
                                constraint.targetAnchor = .width
                                constraint.kind = .constant(value: 180)
                            },
                        ]
                    }
                ]
            }
        )
        ]
    }
}


func randomCharacter() -> String? {
  let numbers = [0,1,2,3,4,5,6, 7, 8, 9]
  let letters = ["A","B","C","D","E","F"]
  
  let numberOrLetter = arc4random_uniform(2)
  
  switch numberOrLetter {
    case 0: return String(numbers[Int(arc4random_uniform(10))])
    case 1: return letters[Int(arc4random_uniform(6))]
    default: return nil
  }
}

func characterArrayToHexString(array: [String]) -> String {
  var hexString = ""
  for character in array {
    hexString += character
  }
  return hexString
}

// Generate a random color in HEX
func generateRandomColor() -> String {
  var characterArray: [String] = []
  for character in 0...5 {
    characterArray.append(randomCharacter()!)
  }
  return characterArrayToHexString(array: characterArray)
}

// Generate an palette (array) of random HEX colors
func generateRandomPalette(amount: Int) -> [String] {
  var colors: [String] = []
  for color in 0...amount - 1 {
    colors.append(generateRandomColor())
  }
  return colors
}
