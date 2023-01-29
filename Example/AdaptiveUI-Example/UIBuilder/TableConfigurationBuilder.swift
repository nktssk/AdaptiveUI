//
//  TableConfigurationBuilder.swift
//  AdaptiveUI-Example
//
//  Created by n.sosyuk on 29.01.2023.
//

import AdaptiveUI

struct TableConfigurationBuilder: ConfigurationBuilderProtocol {
    
    static var layout: [AUIConstraint] = [
        .generate { constraint in
            constraint.target = "TableView"
            constraint.targetAnchor = .top
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .top
            })
        },
        .generate { constraint in
            constraint.target = "TableView"
            constraint.targetAnchor = .bottom
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .bottom
            })
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

    static var views: [ViewConfiguration] = [
        .tableView(
            configuration: .generate() { tableView in
                tableView.identifier = "TableView"
                tableView.data = [
                    .generate() { cell in
                        cell.cellType = "SimpleText"
                        cell.identifierToData = ["label": .text("Казань")]
                    },
                    .generate() { cell in
                        cell.cellType = "SimpleText"
                        cell.identifierToData = ["label": .text("Москва")]
                    },
                    .generate() { cell in
                        cell.cellType = "SimpleText"
                        cell.identifierToData = ["label": .text("Санкт-Петербург")]
                    },
                    .generate() { cell in
                        cell.cellType = "SimpleText"
                        cell.identifierToData = ["label": .text("Набережные Челны")]
                    },
                    .generate() { cell in
                        cell.cellType = "SimpleText"
                        cell.identifierToData = ["label": .text("Нижний Новгород")]
                    },
                    .generate() { cell in
                        cell.cellType = "SimpleText"
                        cell.identifierToData = ["label": .text("Великий Новгород")]
                    },
                    .generate() { cell in
                        cell.cellType = "TwoText"
                        cell.identifierToData = [
                            "Title": .text("Кот обыкновенный"),
                            "Subtitle": .text("Этот котик был взят из мема"),
                            "Image": .image("https://beta.ctvnews.ca/content/dam/ctvnews/images/2019/11/18/1_4691731.png?cache_timestamp=1574134871525"),
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "TwoText"
                        cell.identifierToData = [
                            "Title": .text("Кот обыкновенный"),
                            "Subtitle": .text("Этот котик был взят из мема"),
                            "Image": .image("https://beta.ctvnews.ca/content/dam/ctvnews/images/2019/11/18/1_4691731.png?cache_timestamp=1574134871525"),
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "TwoText"
                        cell.identifierToData = [
                            "Title": .text("Кот обыкновенный"),
                            "Subtitle": .text("Этот котик был взят из мема"),
                            "Image": .image("https://beta.ctvnews.ca/content/dam/ctvnews/images/2019/11/18/1_4691731.png?cache_timestamp=1574134871525"),
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "TwoText"
                        cell.identifierToData = [
                            "Title": .text("Кот обыкновенный"),
                            "Subtitle": .text("Этот котик был взят из мема"),
                            "Image": .image("https://beta.ctvnews.ca/content/dam/ctvnews/images/2019/11/18/1_4691731.png?cache_timestamp=1574134871525"),
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "TwoText"
                        cell.identifierToData = [
                            "Title": .text("Кот обыкновенный"),
                            "Subtitle": .text("Этот котик был взят из мема"),
                            "Image": .image("https://beta.ctvnews.ca/content/dam/ctvnews/images/2019/11/18/1_4691731.png?cache_timestamp=1574134871525"),
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "TwoText"
                        cell.identifierToData = [
                            "Title": .text("Кот обыкновенный"),
                            "Subtitle": .text("Этот котик был взят из мема"),
                            "Image": .image("https://beta.ctvnews.ca/content/dam/ctvnews/images/2019/11/18/1_4691731.png?cache_timestamp=1574134871525"),
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "TwoText"
                        cell.identifierToData = [
                            "Title": .text("Кот обыкновенный"),
                            "Subtitle": .text("Этот котик был взят из мема"),
                            "Image": .image("https://beta.ctvnews.ca/content/dam/ctvnews/images/2019/11/18/1_4691731.png?cache_timestamp=1574134871525"),
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "TwoText"
                        cell.identifierToData = [
                            "Title": .text("Кот обыкновенный"),
                            "Subtitle": .text("Этот котик был взят из мема"),
                            "Image": .image("https://beta.ctvnews.ca/content/dam/ctvnews/images/2019/11/18/1_4691731.png?cache_timestamp=1574134871525"),
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "TwoText"
                        cell.identifierToData = [
                            "Title": .text("Кот обыкновенный"),
                            "Subtitle": .text("Этот котик был взят из мема"),
                            "Image": .image("https://beta.ctvnews.ca/content/dam/ctvnews/images/2019/11/18/1_4691731.png?cache_timestamp=1574134871525"),
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "TwoText"
                        cell.identifierToData = [
                            "Title": .text("Кот обыкновенный"),
                            "Subtitle": .text("Этот котик был взят из мема"),
                            "Image": .image("https://beta.ctvnews.ca/content/dam/ctvnews/images/2019/11/18/1_4691731.png?cache_timestamp=1574134871525"),
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "TwoText"
                        cell.identifierToData = [
                            "Title": .text("Кот обыкновенный"),
                            "Subtitle": .text("Этот котик был взят из мема"),
                            "Image": .image("https://beta.ctvnews.ca/content/dam/ctvnews/images/2019/11/18/1_4691731.png?cache_timestamp=1574134871525"),
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "TwoText"
                        cell.identifierToData = [
                            "Title": .text("Кот обыкновенный"),
                            "Subtitle": .text("Этот котик был взят из мема"),
                            "Image": .image("https://beta.ctvnews.ca/content/dam/ctvnews/images/2019/11/18/1_4691731.png?cache_timestamp=1574134871525"),
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "TwoText"
                        cell.identifierToData = [
                            "Title": .text("Кот обыкновенный"),
                            "Subtitle": .text("Этот котик был взят из мема"),
                            "Image": .image("https://beta.ctvnews.ca/content/dam/ctvnews/images/2019/11/18/1_4691731.png?cache_timestamp=1574134871525"),
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "TwoText"
                        cell.identifierToData = [
                            "Title": .text("Кот обыкновенный"),
                            "Subtitle": .text("Этот котик был взят из мема"),
                            "Image": .image("https://beta.ctvnews.ca/content/dam/ctvnews/images/2019/11/18/1_4691731.png?cache_timestamp=1574134871525"),
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "TwoText"
                        cell.identifierToData = [
                            "Title": .text("Кот обыкновенный"),
                            "Subtitle": .text("Этот котик был взят из мема"),
                            "Image": .image("https://beta.ctvnews.ca/content/dam/ctvnews/images/2019/11/18/1_4691731.png?cache_timestamp=1574134871525"),
                        ]
                    },
                    .generate() { cell in
                        cell.cellType = "TwoText"
                        cell.identifierToData = [
                            "Title": .text("Кот обыкновенный"),
                            "Subtitle": .text("Этот котик был взят из мема"),
                            "Image": .image("https://beta.ctvnews.ca/content/dam/ctvnews/images/2019/11/18/1_4691731.png?cache_timestamp=1574134871525"),
                        ]
                    },
                ]
                tableView.cellsTypes = [
                    "SimpleText": AUITableViewCell.generate() { view in
                        view.identifier = "SimpleText"
                        view.subviews = [
                            .label(configuration: .generate() { label in
                                label.identifier = "label"
                                label.text.fontSize = 15
                                label.text.fontWeight = .medium
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
                                constraint.targetAnchor = .bottom
                                constraint.kind = .relation(configuration: .generate { config in
                                    config.sourceAnchor = .bottom
                                    config.constant = -20
                                })
                            },
                            .generate { constraint in
                                constraint.target = "label"
                                constraint.targetAnchor = .leading
                                constraint.kind = .relation(configuration: .generate { config in
                                    config.sourceAnchor = .leading
                                    config.constant = 10
                                })
                            },
                            .generate { constraint in
                                constraint.target = "label"
                                constraint.targetAnchor = .trailing
                                constraint.kind = .relation(configuration: .generate { config in
                                    config.sourceAnchor = .trailing
                                    config.constant = -10
                                })
                            },
                        ]
                    },
                    "TwoText": AUITableViewCell.generate() { view in
                        view.identifier = "TwoText"
                        view.subviews = [
                            .label(configuration: .generate() { label in
                                label.identifier = "Title"
                                label.text.fontSize = 15
                                label.text.fontWeight = .medium
                            }),
                            .label(configuration: .generate() { label in
                                label.identifier = "Subtitle"
                                label.text.fontSize = 12
                                label.text.fontWeight = .regular
                            }),
                            .imageView(configuration: .generate() { imageView in
                                imageView.identifier = "Image"
                                imageView.cornerRadius = 20
                            })
                        ]
                        view.layout = [
                            .generate { constraint in
                                constraint.target = "Image"
                                constraint.targetAnchor = .top
                                constraint.kind = .relation(configuration: .generate { config in
                                    config.sourceAnchor = .top
                                    config.constant = 10
                                })
                            },
                            .generate { constraint in
                                constraint.target = "Image"
                                constraint.targetAnchor = .bottom
                                constraint.kind = .relation(configuration: .generate { config in
                                    config.sourceAnchor = .bottom
                                    config.constant = -10
                                })
                            },
                            .generate { constraint in
                                constraint.target = "Image"
                                constraint.targetAnchor = .leading
                                constraint.kind = .relation(configuration: .generate { config in
                                    config.sourceAnchor = .leading
                                    config.constant = 20
                                })
                            },
                            .generate { constraint in
                                constraint.target = "Image"
                                constraint.targetAnchor = .width
                                constraint.kind = .constant(value: 40)
                            },
                            .generate { constraint in
                                constraint.target = "Image"
                                constraint.targetAnchor = .height
                                constraint.kind = .constant(value: 40)
                            },
                            .generate { constraint in
                                constraint.target = "Title"
                                constraint.targetAnchor = .top
                                constraint.kind = .relation(configuration: .generate { config in
                                    config.sourceAnchor = .top
                                    config.source = "Image"
                                })
                            },
                            .generate { constraint in
                                constraint.target = "Title"
                                constraint.targetAnchor = .trailing
                                constraint.kind = .relation(configuration: .generate { config in
                                    config.sourceAnchor = .trailing
                                    config.constant = -10
                                })
                            },
                            .generate { constraint in
                                constraint.target = "Title"
                                constraint.targetAnchor = .leading
                                constraint.kind = .relation(configuration: .generate { config in
                                    config.sourceAnchor = .trailing
                                    config.source = "Image"
                                    config.constant = 10
                                })
                            },
                            .generate { constraint in
                                constraint.target = "Subtitle"
                                constraint.targetAnchor = .top
                                constraint.kind = .relation(configuration: .generate { config in
                                    config.sourceAnchor = .bottom
                                    config.source = "Title"
                                    config.constant = 5
                                })
                            },
                            .generate { constraint in
                                constraint.target = "Subtitle"
                                constraint.targetAnchor = .trailing
                                constraint.kind = .relation(configuration: .generate { config in
                                    config.sourceAnchor = .trailing
                                    config.constant = -10
                                })
                            },
                            .generate { constraint in
                                constraint.target = "Subtitle"
                                constraint.targetAnchor = .leading
                                constraint.kind = .relation(configuration: .generate { config in
                                    config.sourceAnchor = .trailing
                                    config.source = "Image"
                                    config.constant = 10
                                })
                            },
                        ]
                    }
                ]
            }
        )
    ]
}
