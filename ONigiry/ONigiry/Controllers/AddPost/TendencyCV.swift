import UIKit
struct Tendency{
    var title:String = ""
    var clicked = false
}

struct TendencyHeaders{
    var tendencyList:[Tendency] = []
}

class TendencyCV: UIView {
    public var items:[TendencyHeaders] = []

    private lazy var collectionView:UICollectionView = {

        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 0)
        
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        //layout.estimatedItemSize = .zero //안됨

        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        ///cell 등록
        collectionView.register(TendencyCell.self, forCellWithReuseIdentifier: TendencyCell.identifier)
        
        /// 헤더 등록
        collectionView.register(TendencyHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TendencyHeader")
        
        /// 코드로 layout 처리 허용
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    

    /// 초기화
    init(items:[TendencyHeaders] = []) {
        
        self.items = items
        
        /// 파라미터 할당 후에 초기화 시켜줘야함.
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 레이아웃 셋팅
    func setupUI(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(collectionView)
    
        /// 컬렉션뷰 제약조건 설정
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalTo: self.widthAnchor) ,
            collectionView.heightAnchor.constraint(equalTo: self.heightAnchor) ,
            collectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor) ,
            collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
