import {
  Directive,
  OnInit,
  Renderer2,
  ElementRef,
  HostListener,
  HostBinding,
  Input
} from "@angular/core";

@Directive({
  selector: "[appBetterHighlight]"
})
export class BetterHighlightDirective implements OnInit {
  @Input() defaultColor: string = "transparent";
  @Input() highlightColor: string = "blue";

  @HostBinding("style.backgroundColor") backgroundColor: string = this
    .defaultColor;

  @HostListener("mouseenter") mouseover(eventData: Event) {
    this.renderer.setStyle(this.elRef.nativeElement, "color", "blue");
    this.backgroundColor = "cyan";
  }

  @HostListener("mouseleave") mouseleave(eventData: Event) {
    this.renderer.setStyle(this.elRef.nativeElement, "color", "black");
    this.backgroundColor = "transparent";
  }
  ngOnInit(): void {
    this.backgroundColor = this.defaultColor;
    // this.renderer.setStyle(this.elRef.nativeElement, "color", "blue");
  }
  constructor(private elRef: ElementRef, private renderer: Renderer2) {}
}
