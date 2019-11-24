import { 
  Component, 
  OnInit, 
  Input, 
  ViewEncapsulation, 
  OnChanges,
  SimpleChanges,
  DoCheck,
  AfterContentInit,
  AfterContentChecked,
  OnDestroy
} from '@angular/core';

@Component({
  selector: 'app-server-element',
  templateUrl: './server-element.component.html',
  styleUrls: ['./server-element.component.scss'],
  encapsulation: ViewEncapsulation.Emulated
})
export class ServerElementComponent implements 
OnInit, 
OnChanges, 
DoCheck, 
AfterContentInit, 
AfterContentChecked, 
OnDestroy {

  @Input('srvElement') element: {
    type: string,
    name: string,
    content: string
  };
  @Input() name: string;

  constructor() { }

  ngOnChanges(changes: SimpleChanges) {
    console.log(changes);
  }

  ngOnInit() {
    console.log('Constructor Logged');
  }

  ngDoCheck() {
    console.log('Do Check Called');
  }

  ngAfterContentInit() {
    console.log('ng after content init');
  }

  ngAfterContentChecked() {
    console.log('ng after content checked');
  }

  ngAfterViewInit() {
    console.log('ng after view init');
  }

  ngAfterViewChecked() {
    console.log('ng after view checked');
  }

  ngOnDestroy() {
    console.log('ng destroy clicked');
  }

}
