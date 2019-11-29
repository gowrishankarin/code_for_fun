import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-even',
  templateUrl: './even.component.html',
  styleUrls: ['./even.component.scss']
})
export class EvenComponent implements OnInit {

  @Input('tick') evenTick: number;
  oddElements = [];

  constructor() { }

  ngOnInit() {
  }

  onTick(event: Event) {
    console.log(event);
    this.oddElements.push({
      eventId: 1
    });
  }
}
