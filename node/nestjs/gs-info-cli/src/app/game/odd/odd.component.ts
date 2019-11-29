import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-odd',
  templateUrl: './odd.component.html',
  styleUrls: ['./odd.component.scss']
})
export class OddComponent implements OnInit {

  @Input('tick') oddTick: number;
  evenElements = [];

  constructor() { }

  ngOnInit() {
    console.log('Fired');
  }

  onTick(event: Event) {
    console.log(event);
    this.evenElements.push({
      eventId: 1
    });
  }
}
