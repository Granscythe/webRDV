package sopra.formation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sopra.formation.model.Motif;
import sopra.formation.repository.IMotifRepository;

@Controller
public class MotifController {
	
	@Autowired
	private IMotifRepository motifRepo;

	@GetMapping("/motif") // ETAPE 1
	public String list(Model model) {
		// ETAPE 2
		List<Motif> motif = this.motifRepo.findAll();

		// ETAPE 3
		model.addAttribute("mesMotifs", motif);

		// ETAPE 4
		return "motif/list";
	}

	@GetMapping("/motif/add")
	public String add() {
		// ETAPE 2 et 3 inutile
		// ETAPE 4
		return "motif/form";
	}

	@GetMapping("/motif/edit")
	public String edit(@RequestParam("id") Long idMotif, Model model) {
		// ETAPE 2
		Motif motif = motifRepo.findById(idMotif).get();

		// ETAPE 3
		model.addAttribute("moti", motif);

		// ETAPE 4
		return "motif/form";
	}
	
	@PostMapping("/motif/save")
	public String save(@RequestParam(required = false) Long id, @RequestParam(required = false, defaultValue = "0") int version, @RequestParam String intitule, @RequestParam Integer duree) {
		Motif motif = new Motif(id, intitule, duree);
		motif.setVersion(version);
		
		motifRepo.save(motif);
		
		return "redirect:/motif";
	}

	@GetMapping("/modif/delete")
	public String delete(@RequestParam Long id) {
		motifRepo.deleteById(id);
		
		return "redirect:/motif";
	}
	
	@GetMapping("/motif/cancel")
	public String cancel() {
		return "forward:/motif";
	}
}

