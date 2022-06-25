//
//  SearchResultItemCell.swift
//  BookFinder
//
//  Created by Tophun on 2022/06/26.
//

import UIKit
import SnapKit
import Then
import Kingfisher

final class SearchResultItemCell: UITableViewCell {
    private lazy var vStack = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 5
        $0.distribution = .fill
        $0.addArrangedSubview(title)
        $0.addArrangedSubview(author)
        $0.addArrangedSubview(publishedDate)
        $0.addArrangedSubview(UIView())
    }
    
    private let thumbnailImageView = UIImageView().then {
        $0.backgroundColor = .secondarySystemBackground
        $0.layer.cornerRadius = 8
    }
    
    private let title = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.text = "제목"
    }
    
    private let author = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .gray
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.text = "작가명"
    }
    
    private let publishedDate = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .gray
        $0.textAlignment = .left
        $0.numberOfLines = 1
        $0.text = "2022"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = .white
    }
    
    private func setupLayout() {
        [thumbnailImageView, vStack].forEach {
            contentView.addSubview($0)
        }
        
        thumbnailImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(70)
            $0.height.equalTo(thumbnailImageView.snp.width).multipliedBy(1.3)
            $0.bottom.lessThanOrEqualToSuperview().inset(10)
        }
        
        vStack.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.lessThanOrEqualToSuperview().inset(10)
        }
    }
}

extension SearchResultItemCell {
    public func bind(_ viewModel: Search.Search.ViewModel.ResultModel) {
        if let url = URL(string: viewModel.thumnailURL) {
            let cornerImageProcessor = RoundCornerImageProcessor(cornerRadius: 8)
            thumbnailImageView.kf.setImage(
                with: url,
                placeholder: nil,
                options: [
                    .transition(.fade(0.45)),
                    .processor(cornerImageProcessor),
                    .cacheMemoryOnly
                ],
                completionHandler: nil
            )
        }
        title.text = viewModel.title
        author.text = viewModel.author
        publishedDate.text = viewModel.publishedDate
    }
}
