import { LightningElement, wire, api  } from 'lwc';
import selectAll from "@salesforce/apex/RoundsContainerController.getRoundsJogadores";
export default class Teste1 extends LightningElement {
  rounds = [];
  roundSelecionado;
  @wire(selectAll) listOfObjectDetails({ error, data }) {
    if (data) {
      this.rounds = data;
    } else if (error) {
      console.log("error: " + error);
    }
  }
}