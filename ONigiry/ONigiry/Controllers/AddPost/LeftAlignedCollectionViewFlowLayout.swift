import UIKit

class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        /// layout 속성값
        guard let attributes = super.layoutAttributesForElements(in: rect) else {
            return []
        }
        
        /// 레이아웃을 지정할 수 있는 속성들
//        for attribute in attributes{
//            //print("frame:\(attribute.frame) , maxX:\(attribute.frame.maxX) row : \(attribute.indexPath.row)")
//        }
        /*
         #FlowLayout이 배치한 attributes에는 frame과 indexPath 등의 요소들이 있는데,
         이 요소들을 이용해서 cell을 움직일 수 있다.
         
         frame:(16.0, 90.0, 60.56375, 25.0) , row : 0
         frame:(96.66666666666667, 90.0, 62.518828125, 25.0) , row : 1
         frame:(179.0, 90.0, 62.846953125, 25.0) , row : 2
         */
  
        
        for (index,value) in attributes.enumerated(){
            
            /// 이 속성의 카테고리가 cell 이면
            if attributes[index].representedElementCategory == .cell {
                ///collectionView의 제일 첫번째 cell 거르기
                ///collectionView InSet Left 를 16으로 주었기 때문
                if value.frame.origin.x == 16 {
                    //print("제일 좌측 cell 입니다. pass합니다.")
                    continue
                }
                
                ///첫번째 다음 cell 의 x 좌표 = 이전 cell의 최대 x 좌표 + cell 간격
                value.frame.origin.x = attributes[index-1].frame.maxX + minimumInteritemSpacing
            }
        }
        return attributes
    }
}
