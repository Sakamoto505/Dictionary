import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ['languageButton', 'languageField', 'searchInput']; // Добавлен searchInput в targets

    connect() {
        this.updateLanguageButton();
        this.setPlaceholder(); // Установить начальный плейсхолдер при подключении
    }

    toggleLanguage() {
        const currentLanguage = this.languageFieldTarget.value;
        const newLanguage = currentLanguage === 'ingush' ? 'russian' : 'ingush';
        this.languageFieldTarget.value = newLanguage;
        this.updateLanguageButton();
        this.setPlaceholder(); // Обновить плейсхолдер после переключения языка
    }

    updateLanguageButton() {
        const currentLanguage = this.languageFieldTarget.value;
        this.languageButtonTarget.textContent = currentLanguage === 'ingush' ? 'Ингушский' : 'Русский';
    }

    setPlaceholder() {
        const currentLanguage = this.languageFieldTarget.value;
        const placeholders = {
            ingush: 'Поиск идет на ингушском...',
            russian: 'Поиск идет на русском...'
        };
        // Убедитесь, что searchInputTarget уже доступен
        if (this.hasSearchInputTarget) {
            this.searchInputTarget.placeholder = placeholders[currentLanguage];
        }
    }
}
