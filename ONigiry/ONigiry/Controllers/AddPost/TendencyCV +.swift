import UIKit

//step.2
extension TendencyCV: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    /// 색션 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }
    
    /// cell 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        if section == 0 {
//            return items[section].tendencyList.count
//        } else if section == 1 {
//            return items[section].tendencyList.count
//        }
        
        return items[section].tendencyList.count
    }
    
    /// cell 구성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TendencyCell.identifier, for: indexPath) as! TendencyCell
        cell.view = TendencyItem(title: items[indexPath.section].tendencyList[indexPath.row].title)
        return cell
    }
    
    /// 각각의 cell 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let title = items[indexPath.section].tendencyList[indexPath.row].title
        let cellWidth = (title as NSString).size(withAttributes: [.font:UIFont.systemFont(ofSize: 14)]).width + 30
        //print("width size : \(cellWidth)")
        return CGSize(width: cellWidth, height: 25)
    }
    

    /// cell 선택 이벤트
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! TendencyCell
        items[indexPath.section].tendencyList[indexPath.row].clicked = !items[indexPath.section].tendencyList[indexPath.row].clicked
        cell.view?.onSelected()
    }
    
    //MARK: 헤더
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
        if kind == UICollectionView.elementKindSectionHeader {
            
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:
                "TendencyHeader", for: indexPath) as! TendencyHeader
            
            return header
        }else{
            return UICollectionReusableView()
        }
    }
}
