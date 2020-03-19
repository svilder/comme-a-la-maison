import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ "box" ];

  addBoxClass() {
    this.boxTarget.classList.add('boxactive');
  }
}
