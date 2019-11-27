import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-game',
  templateUrl: './game.component.html',
  styleUrls: ['./game.component.scss']
})
export class GameComponent implements OnInit {

  oddTicks: number[] = [];
  evenTicks: number[] = [];

  constructor() { }

  ngOnInit() {
  }

  onTick(event: Event) {
    console.log(event['eventId']);
    if(event['eventId'] % 2 === 0) {
      this.evenTicks.push(event['eventId']); 
    } else {
      this.oddTicks.push(event['eventId']); 
    }
  }
}
