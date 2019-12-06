import {
  Directive,
  OnInit,
  Renderer2,
  ElementRef,
  HostListener
} from "@angular/core";

@Directive({
  selector: "[appBetterHighlight]"
})
export class BetterHighlightDirective implements OnInit {
  @HostListener("mouseenter") mouseover(eventData: Event) {
    this.renderer.setStyle(this.elRef.nativeElement, "color", "blue");
  }

  @HostListener("mouseleave") mouseleave(eventData: Event) {
    this.renderer.setStyle(this.elRef.nativeElement, "color", "black");
  }
  ngOnInit(): void {
    this.renderer.setStyle(this.elRef.nativeElement, "color", "blue");
  }
  constructor(private elRef: ElementRef, private renderer: Renderer2) {}
}
