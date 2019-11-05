import { Component, OnInit } from '@angular/core';

@Component({
  selector: '[app-warning-alert]',
  // This overrides the html file
  template: `
  <h5>This is Warning Alert!, Overridden by template. ie Not from template url html file.</h5>
  `,
  // This overrides the stylesheet file
  styles: [`
    h5 {
      padding: 20px;
      background-color: mistyrose;
      border: 1px solid red;
    }
  `]
})
export class WarningAlertComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

}