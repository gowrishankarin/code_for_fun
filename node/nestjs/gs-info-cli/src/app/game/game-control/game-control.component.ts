import { 
  Component, 
  OnInit, 
  Output, 
  EventEmitter
} from '@angular/core';

@Component({
  selector: 'app-game-control',
  templateUrl: './game-control.component.html',
  styleUrls: ['./game-control.component.scss']
})
export class GameControlComponent implements OnInit {

  @Output() ticker = new EventEmitter<{ eventId: Number }>();
  eventId: number = 0;

  eventInterval: any;

  constructor() { }

  ngOnInit() {
  }

  onGameStart() {
    this.eventInterval = setInterval(() => {
      this.eventId++;
      this.ticker.emit({
        eventId: this.eventId
      });
    }, 1000);
  }

  onGameEnd() {
    clearInterval(this.eventInterval);
  }

}
