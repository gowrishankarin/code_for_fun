import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ServerMainComponent } from './server-main.component';

describe('ServerMainComponent', () => {
  let component: ServerMainComponent;
  let fixture: ComponentFixture<ServerMainComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ServerMainComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ServerMainComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
