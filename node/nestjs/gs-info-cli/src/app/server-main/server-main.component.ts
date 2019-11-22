import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-server-main',
  templateUrl: './server-main.component.html',
  styleUrls: ['./server-main.component.scss']
})
export class ServerMainComponent implements OnInit {
  
  serverElements = [{
    type: 'server', name: 'Test Server', content: 'Just a Test!'
  }];
  newServerName = '';
  newServerContent = '';

  constructor() { }

  ngOnInit() {
  }
}
