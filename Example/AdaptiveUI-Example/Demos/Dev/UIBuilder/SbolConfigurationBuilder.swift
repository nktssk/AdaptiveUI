//
//  SbolConfigurationBuilder.swift
//  AdaptiveUI-Example
//
//  Created by Nikita Sosyuk on 27.05.2023.
//

import AdaptiveUI

struct SbolConfigurationBuilder: ConfigurationBuilderProtocol {
    static var layout: [AUIConstraint] {
        [
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .height
                    $0.multiplier = 0.35
                })
                $0.target = "GreenView"
                $0.targetAnchor = .height
            },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .leading
                })
                $0.target = "GreenView"
                $0.targetAnchor = .leading
            },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .trailing
                })
                $0.target = "GreenView"
                $0.targetAnchor = .trailing
            },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .top
                })
                $0.target = "GreenView"
                $0.targetAnchor = .top
            },
            
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .top
                    $0.source = "GreenView"
                    $0.constant = 8
                })
                $0.target = "TitleIdentifier"
                $0.targetAnchor = .top
            },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .leading
                })
                $0.target = "TitleIdentifier"
                $0.targetAnchor = .leading
            },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .trailing
                })
                $0.target = "TitleIdentifier"
                $0.targetAnchor = .trailing
            },
            
                .generate() {
                    $0.kind = .relation(configuration: .generate() {
                        $0.sourceAnchor = .bottom
                        $0.source = "TitleIdentifier"
                        $0.constant = 8
                    })
                    $0.target = "SuperGreenView"
                    $0.targetAnchor = .top
                },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .height
                    $0.multiplier = 0.1
                })
                $0.target = "SuperGreenView"
                $0.targetAnchor = .height
            },
                .generate() {
                    $0.kind = .relation(configuration: .generate() {
                        $0.sourceAnchor = .leading
                    })
                    $0.target = "SuperGreenView"
                    $0.targetAnchor = .leading
                },
                .generate() {
                    $0.kind = .relation(configuration: .generate() {
                        $0.sourceAnchor = .trailing
                    })
                    $0.target = "SuperGreenView"
                    $0.targetAnchor = .trailing
                },
            
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .centerX
                    $0.source = "SuperGreenView"
                })
                $0.target = "Sum"
                $0.targetAnchor = .centerX
            },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .centerY
                    $0.source = "SuperGreenView"
                })
                $0.target = "Sum"
                $0.targetAnchor = .centerY
            },
        
            
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .bottom
                    $0.source = "SuperGreenView"
                    $0.constant = 14
                })
                $0.target = "LightGreenView"
                $0.targetAnchor = .top
            },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .leading
                    $0.constant = 16
                })
                $0.target = "LightGreenView"
                $0.targetAnchor = .leading
            },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .trailing
                    $0.constant = -16
                })
                $0.target = "LightGreenView"
                $0.targetAnchor = .trailing
            },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .bottom
                    $0.source = "GreenView"
                    $0.constant = -16
                })
                $0.target = "LightGreenView"
                $0.targetAnchor = .bottom
            },
            
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .top
                    $0.constant = 8
                    $0.source = "LightGreenView"
                })
                $0.target = "TextView"
                $0.targetAnchor = .top
            },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .leading
                    $0.source = "LightGreenView"
                    $0.constant = 8
                })
                $0.target = "TextView"
                $0.targetAnchor = .leading
            },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .trailing
                    $0.source = "LightGreenView"
                    $0.constant = -8
                })
                $0.target = "TextView"
                $0.targetAnchor = .trailing
            },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .bottom
                    $0.source = "LightGreenView"
                    $0.constant = -8
                })
                $0.target = "TextView"
                $0.targetAnchor = .bottom
            },
            
    
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .bottom
                    $0.source = "GreenView"
                    $0.constant = 20
                })
                $0.target = "CardView"
                $0.targetAnchor = .top
            },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .leading
                    $0.constant = 20
                })
                $0.target = "CardView"
                $0.targetAnchor = .leading
            },
            .generate() {
                $0.kind = .constant(value: 30)
                $0.target = "CardView"
                $0.targetAnchor = .width
            },
            .generate() {
                $0.kind = .constant(value: 15)
                $0.target = "CardView"
                $0.targetAnchor = .height
            },
            
                .generate() {
                    $0.kind = .relation(configuration: .generate() {
                        $0.sourceAnchor = .bottom
                        $0.source = "GreenView"
                        $0.constant = 10
                    })
                    $0.target = "SourceLabel"
                    $0.targetAnchor = .top
                },
                .generate() {
                    $0.kind = .relation(configuration: .generate() {
                        $0.sourceAnchor = .leading
                        $0.constant = 60
                    })
                    $0.target = "SourceLabel"
                    $0.targetAnchor = .leading
                },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .trailing
                })
                $0.target = "SourceLabel"
                $0.targetAnchor = .trailing
            },
            
                .generate() {
                    $0.kind = .relation(configuration: .generate() {
                        $0.sourceAnchor = .bottom
                        $0.source = "SourceLabel"
                        $0.constant = 8
                    })
                    $0.target = "CardLabel"
                    $0.targetAnchor = .top
                },
                .generate() {
                    $0.kind = .relation(configuration: .generate() {
                        $0.sourceAnchor = .leading
                        $0.constant = 60
                    })
                    $0.target = "CardLabel"
                    $0.targetAnchor = .leading
                },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .trailing
                })
                $0.target = "CardLabel"
                $0.targetAnchor = .trailing
            },
            
                .generate() {
                    $0.kind = .relation(configuration: .generate() {
                        $0.sourceAnchor = .bottom
                        $0.source = "CardLabel"
                        $0.constant = 8
                    })
                    $0.target = "CardNumberLabel"
                    $0.targetAnchor = .top
                },
                .generate() {
                    $0.kind = .relation(configuration: .generate() {
                        $0.sourceAnchor = .leading
                        $0.constant = 60
                    })
                    $0.target = "CardNumberLabel"
                    $0.targetAnchor = .leading
                },
            .generate() {
                $0.kind = .relation(configuration: .generate() {
                    $0.sourceAnchor = .trailing
                })
                $0.target = "CardNumberLabel"
                $0.targetAnchor = .trailing
            },
            
                .generate() {
                    $0.kind = .relation(configuration: .generate() {
                        $0.sourceAnchor = .centerY
                        $0.source = "CardLabel"
                    })
                    $0.target = "SumLabel"
                    $0.targetAnchor = .centerY
                },
                .generate() {
                    $0.kind = .relation(configuration: .generate() {
                        $0.sourceAnchor = .trailing
                        $0.constant = 10
                    })
                    $0.target = "SumLabel"
                    $0.targetAnchor = .leading
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
                        config.constant = -55
                    })
                }
        ]
    }
    
    static var views: [ViewConfiguration] {
        
        [
            .view(
                configuration: .generate() {
                    $0.identifier = "GreenView"
                    $0.backgroundColor = .generate() {
                        $0.darkThemeColor = "#419051"
                        $0.lightThemeColor = "#419051"
                    }
                }
            ),
            .label(
                configuration: .generate() {
                    $0.identifier = "TitleIdentifier"
                    $0.text = .generate() {
                        $0.content = "Сумма"
                        $0.fontSize = 20
                        $0.fontWeight = .medium
                    }
                    $0.textColor = .generate() {
                        $0.lightThemeColor = "#FFFFFF"
                    }
                    $0.alpha = 0.8
                    $0.alignment = .center
                }
            ),
            .view(
                configuration: .generate() {
                    $0.identifier = "SuperGreenView"
                    $0.backgroundColor = .generate() {
                        $0.darkThemeColor = "#316D3E"
                        $0.lightThemeColor = "#316D3E"
                    }
                }
            ),
            .label(
                configuration: .generate() {
                    $0.identifier = "Sum"
                    $0.text = .generate() {
                        $0.content = "2 307 ₽"
                        $0.fontSize = 30
                        $0.fontWeight = .medium
                    }
                    $0.alignment = .center
                    $0.textColor = .generate() {
                        $0.lightThemeColor = "#FFFFFF"
                    }
                }
            ),
            .view(
                configuration: .generate() {
                    $0.identifier = "LightGreenView"
                    $0.backgroundColor = .generate() {
                        $0.darkThemeColor = "#4D9A64"
                        $0.lightThemeColor = "#4D9A64"
                    }
                    $0.cornerRadius = 16
                }
            ),
            
            
                .view(
                    configuration: .generate() {
                        $0.identifier = "CardView"
                        $0.backgroundColor = .generate() {
                            $0.darkThemeColor = "#4D9A64"
                            $0.lightThemeColor = "#4D9A64"
                        }
                        $0.cornerRadius = 8
                    }
                ),
            
            .textView(configuration: .generate() {
                $0.identifier = "TextView"
                $0.text = .generate() {
                    $0.content = "Перевод через систему быстрый платежей BSOLPay. Оплата товара на сумму 2 307 рублей."
                    $0.fontSize = 16
                }
                $0.alpha = 0.7
                $0.color = .generate() {
                    $0.lightThemeColor = "#FFFFFF"
                }
            }),
            .label(configuration: .generate() {
                $0.identifier = "SourceLabel"
                $0.text = .generate() {
                    $0.content = "Счет списания"
                    $0.fontWeight = .medium
                }
                $0.textColor = .generate() {
                    $0.darkThemeColor = "#B8B8B8"
                    $0.lightThemeColor = "#B8B8B8"
                }
            }),
            .label(configuration: .generate() {
                $0.identifier = "CardLabel"
                $0.text = .generate() {
                    $0.content = "MasterCard Mass"
                    $0.fontWeight = .medium
                }
            }),
            .label(configuration: .generate() {
                $0.identifier = "CardNumberLabel"
                $0.text = .generate() {
                    $0.content = "**** 5775"
                    $0.fontWeight = .medium
                }
            }),
            .label(configuration: .generate() {
                $0.identifier = "SumLabel"
                $0.text = .generate() {
                    $0.content = "491,43 ₽"
                    $0.fontSize = 12
                    $0.fontWeight = .medium
                }
            }),
            .button(configuration: .generate() {
                $0.identifier = "Button"
                $0.cornerRadius = 20
                $0.backgroundColor = .generate() {
                    $0.darkThemeColor = "#316D3E"
                    $0.lightThemeColor = "#316D3E"
                }
                $0.text = .generate() {
                    $0.content = "Продолжить"
                }
                $0.actionHandler = [
                    .standard(type: .dismiss(time: 2.0)),
                    .standard(type: .transform(content: .generate() {
                        $0.id = "Sum"
                        $0.duration = 1.0
                        $0.params = [.text(value: "Отправлено!")]
                    }))
                ]
            }),
        ]
        
        
    }
    
    static var cache: Bool { false }
    
    static var controller: AUIController {
        .generate { configuration in
            configuration.kind = .static
            configuration.title = "Оплата через BSOLPay"
        }
    }
}
