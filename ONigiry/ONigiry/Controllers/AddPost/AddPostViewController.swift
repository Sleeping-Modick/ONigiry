import UIKit
import SnapKit

final class AddPostViewController: UIViewController {
    var labelView = LabelView()
    let fruits = ["사과", "배", "포도", "망고", "딸기", "바나나", "파인애플"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        customNavigationBarButtons()
        
        view.addSubview(labelView.verticalStackView)
        setupUI()
        createPickerView(tagNo: 1)
        dismissPickerView()
        
    }

    
    private func setupUI() {
        let verticalStackView = labelView.verticalStackView
        labelView.selectSection.text = "섹션 선택"
        labelView.title.text = "제목"
        labelView.content.text = "내용"
        labelView.addPhoto.text = "사진추가"
        labelView.keyWord.text = "키워드"
        
        verticalStackView.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16.0)
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16.0)
                make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16.0)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-90.0)
        }
        
//        NSLayoutConstraint.activate([
//            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
//            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
//            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
//            verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90.0)
//        ])
               
        // 라벨들을 수직 스택뷰에 추가
        labelView.sectionStackView.addArrangedSubview(labelView.selectSection)
        labelView.sectionStackView.addArrangedSubview(labelView.sectionTextField)
        labelView.titleStackView.addArrangedSubview(labelView.title)
        labelView.titleStackView.addArrangedSubview(labelView.titleTextField)
        
        verticalStackView.addArrangedSubview(labelView.sectionStackView)
        verticalStackView.addArrangedSubview(labelView.titleStackView)
        verticalStackView.addArrangedSubview(labelView.content)
        verticalStackView.addArrangedSubview(labelView.contentTextView)
        verticalStackView.addArrangedSubview(labelView.addPhoto)
        verticalStackView.addArrangedSubview(labelView.keyWord)
        
        
    }
}

extension AddPostViewController:  UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruits.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return fruits[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelView.sectionTextField.text = fruits[row]
    }
    
    func createPickerView(tagNo : Int) {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        labelView.sectionTextField.inputView = pickerView
    }
    
    func dismissPickerView() {
            let toolBar = UIToolbar()
            toolBar.sizeToFit()
            let button = UIBarButtonItem(title: "선택", style: .plain, target: self, action: nil)
            toolBar.setItems([button], animated: true)
            toolBar.isUserInteractionEnabled = true
        labelView.sectionTextField.inputAccessoryView = toolBar
    }
}

extension AddPostViewController: UITextFieldDelegate {
    
}

extension AddPostViewController {
    private func customNavigationBarButtons() {
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: nil)
        cancelButton.tintColor = .systemRed
        let confirmButton = UIBarButtonItem(title: "등록", style: .plain, target: self, action: nil)
        confirmButton.tintColor = .black

        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = confirmButton
    }
}
