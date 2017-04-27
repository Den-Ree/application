//
//  EventPreviewTableViewCellModel.swift
//  CHMeetupApp
//
//  Created by Alexander Zimin on 11/03/2017.
//  Copyright © 2017 CocoaHeads Community. All rights reserved.
//

import UIKit

struct EventPreviewTableViewCellModel: TemplatableCellViewModelType {
  let entity: EventEntity
  let index: Int
  weak var delegate: EventPreviewTableViewCellDelegate?
  let groupImageLoader: GroupImageLoader
}

extension EventPreviewTableViewCellModel: CellViewModelType {
  func setup(on cell: EventPreviewTableViewCell) {
    cell.eventImageView.image = entity.isTemplate ? #imageLiteral(resourceName: "img_event_template_b&w") : #imageLiteral(resourceName: "img_event_template")
    cell.nameLabel.text = entity.title
    cell.dateLabel.text = entity.startDate.defaultFormatString

    if let place = entity.place {
      cell.placeLabel.text = place.city + ", " + place.title
    }

    cell.isEnabledForRegistration = entity.isRegistrationOpen
    cell.delegate = delegate
    cell.photosPresentationView.photos.removeAll()
    let urls = event.speakerPhotosURLs.map { URL(string: $0.value) }.flatMap { $0 } as [URL]

    cell.photosPresentationView.photos = urls.map({ _ in
      return UIImage(named: "img_template_unknown")!
    })

    groupImageLoader.loadImages(groupId: cell.hashValue,
                                urls: urls,
                                completionHandler: { [weak cell] images in
      cell?.photosPresentationView.photos = images
    })
  }
}
