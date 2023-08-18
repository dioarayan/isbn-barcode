import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="bs-modal"
export default class extends Controller {
  connect(){
    console.log('connected!')
  }

  cancel(element){
    console.log(this.element)
  }

}