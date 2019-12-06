import {
  Directive,
  OnInit,
  Renderer2,
  ElementRef,
  HostListener,
  HostBinding
} from "@angular/core";

@Directive({
  selector: "[appBetterHighlight]"
})
export class BetterHighlightDirective implements OnInit {
  @HostBinding("style.backgroundColor") backgroundColor: string = "transparent";

  @HostListener("mouseenter") mouseover(eventData: Event) {
    this.renderer.setStyle(this.elRef.nativeElement, "color", "blue");
    this.backgroundColor = "cyan";
  }

  @HostListener("mouseleave") mouseleave(eventData: Event) {
    this.renderer.setStyle(this.elRef.nativeElement, "color", "black");
    this.backgroundColor = "transparent";
  }
  ngOnInit(): void {
    // this.renderer.setStyle(this.elRef.nativeElement, "color", "blue");
  }
  constructor(private elRef: ElementRef, private renderer: Renderer2) {}
}
