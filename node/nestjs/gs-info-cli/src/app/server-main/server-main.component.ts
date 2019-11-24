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

  onServerAdded(serverData: {
    serverName: string, serverContent: string
  }) {
    this.serverElements.push({
      type: 'server',
      name: serverData.serverName,
      content: serverData.serverContent
    });
  }

  onBlueprintAdded(blueprintData: {
    serverName: string,
    serverContent: string
  }) {
    this.serverElements.push({
      type: 'blueprint',
      name: blueprintData.serverName,
      content: blueprintData.serverContent
    });
  }

  onChangeFirst() {
    this.serverElements[0].name = 'Changed!';
  }

  onDeleteFirst() {
    this.serverElements.splice(0, 1);
  }
}
