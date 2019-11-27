import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-even',
  templateUrl: './even.component.html',
  styleUrls: ['./even.component.scss']
})
export class EvenComponent implements OnInit {

  oddElements = [];

  constructor() { }

  ngOnInit() {
  }

  onTick() {
    this.oddElements.push({
      eventId: 1
    });
  }
}
