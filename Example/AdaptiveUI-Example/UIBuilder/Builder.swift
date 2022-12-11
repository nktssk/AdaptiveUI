//
//  Builder.swift
//  AdaptiveUI-Example
//
//  Created by n.sosyuk on 04.12.2022.
//

import SwiftUI
import AdaptiveUI

struct ConfigurationBuilder: ConfigurationBuilderProtocol {

    static var controller: AUIController {
        .generate { configuration in
            configuration.kind = .scrollable
            configuration.title = "Перевод между счетами"
        }
    }

    static var layout: [AUIConstraint] = [
        .generate { constraint in
            constraint.target = "SourceView"
            constraint.targetAnchor = .top
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .top
                config.constant = 10
            })
        },
        .generate { constraint in
            constraint.target = "SourceView"
            constraint.targetAnchor = .centerX
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .centerX
            })
        },
        .generate { constraint in
            constraint.target = "SourceView"
            constraint.targetAnchor = .width
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .width
                config.constant = -22
            })
        },
        .generate { constraint in
            constraint.target = "SourceView"
            constraint.targetAnchor = .height
            constraint.kind = .constant(value: 120)
        },


        .generate { constraint in
            constraint.target = "SourceSumLabel"
            constraint.targetAnchor = .centerY
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .centerY
                config.constant = 10
            })
        },
        .generate { constraint in
            constraint.target = "SourceSumLabel"
            constraint.targetAnchor = .trailing
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .trailing
                config.constant = -20
            })
        },
        .generate { constraint in
            constraint.target = "SourceSumLabel"
            constraint.targetAnchor = .leading
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .leading
                config.constant = 20
            })
        },

        .generate { constraint in
            constraint.target = "SourceTargetLabel"
            constraint.targetAnchor = .bottom
            constraint.kind = .relation(configuration: .generate { config in
                config.source = "SourceSumLabel"
                config.sourceAnchor = .top
                config.constant = -5
            })
        },
        .generate { constraint in
            constraint.target = "SourceTargetLabel"
            constraint.targetAnchor = .trailing
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .trailing
                config.constant = -10
            })
        },
        .generate { constraint in
            constraint.target = "SourceTargetLabel"
            constraint.targetAnchor = .leading
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .leading
                config.constant = 20
            })
        },
        
        .generate { constraint in
            constraint.target = "TargetView"
            constraint.targetAnchor = .top
            constraint.kind = .relation(configuration: .generate { config in
                config.source = "SourceView"
                config.sourceAnchor = .bottom
                config.constant = 30
            })
        },
        .generate { constraint in
            constraint.target = "TargetView"
            constraint.targetAnchor = .centerX
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .centerX
            })
        },
        .generate { constraint in
            constraint.target = "TargetView"
            constraint.targetAnchor = .width
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .width
                config.constant = -22
            })
        },
        .generate { constraint in
            constraint.target = "TargetView"
            constraint.targetAnchor = .height
            constraint.kind = .constant(value: 120)
        },

        .generate { constraint in
            constraint.target = "TargetSumLabel"
            constraint.targetAnchor = .centerY
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .centerY
                config.constant = 10
            })
        },
        .generate { constraint in
            constraint.target = "TargetSumLabel"
            constraint.targetAnchor = .trailing
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .trailing
                config.constant = -20
            })
        },
        .generate { constraint in
            constraint.target = "TargetSumLabel"
            constraint.targetAnchor = .leading
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .leading
                config.constant = 20
            })
        },

        .generate { constraint in
            constraint.target = "TargetTargetLabel"
            constraint.targetAnchor = .bottom
            constraint.kind = .relation(configuration: .generate { config in
                config.source = "TargetSumLabel"
                config.sourceAnchor = .top
                config.constant = -5
            })
        },
        .generate { constraint in
            constraint.target = "TargetTargetLabel"
            constraint.targetAnchor = .trailing
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .trailing
                config.constant = -10
            })
        },
        .generate { constraint in
            constraint.target = "TargetTargetLabel"
            constraint.targetAnchor = .leading
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .leading
                config.constant = 20
            })
        },

        .generate { constraint in
            constraint.target = "SumTextField"
            constraint.targetAnchor = .top
            constraint.kind = .relation(configuration: .generate { config in
                config.source = "TargetView"
                config.sourceAnchor = .bottom
                config.constant = 30
            })
        },
        .generate { constraint in
            constraint.target = "SumTextField"
            constraint.targetAnchor = .leading
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .leading
                config.constant = 15
            })
        },
        .generate { constraint in
            constraint.target = "SumTextField"
            constraint.targetAnchor = .trailing
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .trailing
                config.constant = -15
            })
        },

        .generate { constraint in
            constraint.target = "SeparatorView"
            constraint.targetAnchor = .leading
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .leading
                config.constant = 15
            })
        },
        .generate { constraint in
            constraint.target = "SeparatorView"
            constraint.targetAnchor = .trailing
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .trailing
                config.constant = -15
            })
        },
        .generate { constraint in
            constraint.target = "SeparatorView"
            constraint.targetAnchor = .height
            constraint.kind = .constant(value: 0.5)
        },
        .generate { constraint in
            constraint.target = "SeparatorView"
            constraint.targetAnchor = .top
            constraint.kind = .relation(configuration: .generate { config in
                config.source = "SumTextField"
                config.sourceAnchor = .bottom
                config.constant = 10
            })
        },

        .generate { constraint in
            constraint.target = "PriceLabel"
            constraint.targetAnchor = .top
            constraint.kind = .relation(configuration: .generate { config in
                config.source = "SumTextField"
                config.sourceAnchor = .bottom
                config.constant = 18
            })
        },
        .generate { constraint in
            constraint.target = "PriceLabel"
            constraint.targetAnchor = .leading
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .leading
                config.constant = 15
            })
        },
        .generate { constraint in
            constraint.target = "PriceLabel"
            constraint.targetAnchor = .trailing
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .trailing
                config.constant = -15
            })
        },

        .generate { constraint in
            constraint.target = "Button"
            constraint.targetAnchor = .top
            constraint.kind = .relation(configuration: .generate { config in
                config.source = "PriceLabel"
                config.sourceAnchor = .bottom
                config.constant = 10
            })
        },
        .generate { constraint in
            constraint.target = "Button"
            constraint.targetAnchor = .height
            constraint.kind = .constant(value: 55)
        },
        .generate { constraint in
            constraint.target = "Button"
            constraint.targetAnchor = .trailing
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .trailing
                config.constant = -10
            })
        },
        .generate { constraint in
            constraint.target = "Button"
            constraint.targetAnchor = .leading
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .leading
                config.constant = 10
            })
        },
        .generate { constraint in
            constraint.target = "Button"
            constraint.targetAnchor = .bottom
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .bottom
            })
        },
        .generate { constraint in
            constraint.target = "Button"
            constraint.targetAnchor = .width
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .width
                config.constant = -20
            })
        }
    ]

    static var views: [ViewConfiguration] = [
        .view(configuration: .generate { backgroundView in
            backgroundView.identifier = "SourceView"
            backgroundView.cornerRadius = 20
            backgroundView.backgroundColor = .generate { color in
                color.lightThemeColor = "#454545"
                color.darkThemeColor = "#494949"
            }
            backgroundView.subviews = [
                .label(configuration: .generate { label in
                    label.identifier = "SourceTargetLabel"
                    label.text.fontSize = 15
                    label.text.fontWeight = .medium
                    label.text.content = "Со счета *4053"
                    label.textColor = .generate { color in
                        color.lightThemeColor = "#979797"
                        color.darkThemeColor = "#979797"
                    }
                }),
                .label(configuration: .generate { label in
                    label.identifier = "SourceSumLabel"
                    label.text.fontSize = 35
                    label.text.fontWeight = .bold
                    label.text.content = "13 4534,54 $"
                    label.textColor = .generate { color in
                        color.lightThemeColor = "#FFFFFF"
                        color.darkThemeColor = "#FFFFFF"
                    }
                })
            ]
        }),
        .view(configuration: .generate { backgroundView in
            backgroundView.identifier = "TargetView"
            backgroundView.cornerRadius = 20
            backgroundView.backgroundColor = .generate { color in
                color.lightThemeColor = "#555E73"
                color.darkThemeColor = "#555E73"
            }
            backgroundView.subviews = [
                .label(configuration: .generate { label in
                    label.identifier = "TargetSumLabel"
                    label.text.fontSize = 35
                    label.text.fontWeight = .bold
                    label.text.content = "14 534,81 ₽"
                    label.textColor = .generate { color in
                        color.lightThemeColor = "#FFFFFF"
                        color.darkThemeColor = "#FFFFFF"
                    }
                }),
                .label(configuration: .generate { label in
                    label.identifier = "TargetTargetLabel"
                    label.text.fontSize = 15
                    label.text.fontWeight = .medium
                    label.text.content = "На накопительный счет \"ИнвестКопилка\""
                    label.textColor = .generate { color in
                        color.lightThemeColor = "#A8AEBE"
                        color.darkThemeColor = "#A8AEBE"
                    }
                })
            ]
        }),
        .textField(configuration: .generate { textField in
            textField.identifier = "SumTextField"
            textField.placeholder = "Сумма от 0,01 $ до 20 000 $"
            textField.textColor = .generate { color in
                color.lightThemeColor = "#000000"
                color.darkThemeColor = "#FFFFFF"
            }
            textField.text.content = ""
            textField.text.fontSize = 20
            textField.text.fontWeight = .regular
            textField.cleanButtonMode = .whileEditing
            textField.borderStyle = .none
            textField.keyboardType = .numberPad
        }),
        .view(configuration: .generate { view in
            view.identifier = "SeparatorView"
            view.alpha = 0.5
            view.backgroundColor = .generate { color in
                color.lightThemeColor = "#A2A1AA"
                color.darkThemeColor = "#A2A1AA"
            }
        }),
        .label(configuration: .generate { label in
            label.identifier = "PriceLabel"
            label.text.content = "Размер комиссии будет уточнен после ввода реквизитов платежа"
            label.maxNumberOfLines = .zero
            label.text.fontSize = 14
            label.textColor = .generate { color in
                color.lightThemeColor = "#000000"
                color.darkThemeColor = "#FFFFFF"
            }
        }),
        .button(configuration: .generate { button in
            button.identifier = "Button"
            button.backgroundColor = .generate { color in
                color.lightThemeColor = "#FADE55"
                color.darkThemeColor = "#FADE55"
            }
            button.selectedColor = .generate { color in
                color.lightThemeColor = "#F7DD57"
                color.darkThemeColor = "#F7DD57"
            }
            button.text = AUIText()
            button.text?.fontSize = 16
            button.text?.fontWeight = .regular
            button.text?.content = "Отправить"
            button.cornerRadius = 20
            button.textColor = .generate { color in
                color.lightThemeColor = "#000000"
                color.lightThemeColor = "#000000"
            }
            button.actionHandler = .custom(id: "SendButtonTapped")
        })
    ]
}
