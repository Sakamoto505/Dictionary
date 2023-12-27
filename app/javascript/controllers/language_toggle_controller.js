// app/javascript/controllers/language_toggle_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ['languageButton', 'languageField'];

    connect() {
        console.log('Контроллер успешно подключен!');
    }

    toggleLanguage() {
        console.log('Метод toggleLanguage вызван!');
        const currentLanguage = this.languageFieldTarget.value;
        const newLanguage = currentLanguage === 'ingush' ? 'russian' : 'ingush';
        console.log(this)
        // Обновляем значение скрытого поля
        this.languageFieldTarget.value = newLanguage;


        console.log(`Переключение языка на: ${newLanguage}`);
    }
}
