import { Directive, OnInit, Renderer2, ElementRef } from "@angular/core";

@Directive({
  selector: "[appBetterHighlight]"
})
export class BetterHighlightDirective implements OnInit {
  ngOnInit(): void {
    this.renderer.setStyle(this.elRef.nativeElement, "color", "blue");
  }
  constructor(private elRef: ElementRef, private renderer: Renderer2) {}
}
