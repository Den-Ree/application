//
//  TextFieldPlateTableViewCellModel.swift
//  CHMeetupApp
//
//  Created by Alexander Zimin on 18/03/2017.
//  Copyright © 2017 CocoaHeads Community. All rights reserved.
//

import UIKit

struct TextFieldPlateTableViewCellModel {
  let placeholder: String
  weak var textFieldDelegate: UITextFieldDelegate?
}

extension TextFieldPlateTableViewCellModel: CellViewModelType {
  func setup(on cell: TextFieldPlateTableViewCell) {
    cell.textField.placeholder = placeholder
    cell.textField.delegate = textFieldDelegate
  }
}
