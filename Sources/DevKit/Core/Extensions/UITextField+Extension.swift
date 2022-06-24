//
// Copyright (c) 2021 Related Code - https://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import TinyConstraints
import Then
import NSObject_Rx

extension UITextField {

    func addPaddingRight(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        rightView = paddingView
        rightViewMode = .always
    }

    func addPaddingRightIcon(_ image: UIImage, padding: CGFloat) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        rightView = imageView
        rightView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
        rightViewMode = .always
    }
    
    public func addInputView() {
        let endEditButton = UIButton(type: .system).then { button in
            let config = UIImage.SymbolConfiguration(pointSize: 24)
            let image = UIImage(systemName: "keyboard.chevron.compact.down", withConfiguration: config)?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
            button.setBackgroundImage(image, for: .normal)
        }
        let frame = CGRect(x: 0, y: 0, width: 0, height: 40)
        self.inputAccessoryView = UIInputView(frame: frame, inputViewStyle: .keyboard)
        inputAccessoryView?.addSubview(endEditButton)
        endEditButton.centerYToSuperview()
        endEditButton.rightToSuperview(offset:-16)
        endEditButton.rx.tap.asObservable().subscribe { _ in
            self.endEditing(false)
        }.disposed(by: rx.disposeBag)
    }
}
