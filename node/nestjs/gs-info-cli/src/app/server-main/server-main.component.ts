import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-server-main',
  templateUrl: './server-main.component.html',
  styleUrls: ['./server-main.component.scss']
})
export class ServerMainComponent implements OnInit {

  serverElements = [];
  newServerName = '';
  newServerContent = '';

  constructor() { }

  ngOnInit() {
  }

  onAddServer() {
    this.serverElements.push({
      type: 'server',
      name: this.newServerName,
      content: this.newServerContent
    });
  }

  onAddBlueprint() {
    this.serverElements.push({
      type: 'blueprint',
      name: this.newServerName,
      content: this.newServerContent
    })
  }

}
