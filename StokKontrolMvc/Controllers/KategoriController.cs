using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StokKontrolMvc.Models.Entity;

namespace StokKontrolMvc.Controllers
{
    public class KategoriController : Controller
    {
        StokTakipEntities ctx = new StokTakipEntities();

        // GET: Kategori

        public ActionResult Index()
        {
            var degerler = ctx.Kategoriler.ToList();
            return View(degerler);
        }
        public ActionResult KategoriEkle()
        {
            return View();
        }
        [HttpPost]
        public ActionResult KategoriEkle(Kategoriler u)
        {
            ctx.Kategoriler.Add(u);
            ctx.SaveChanges();
            return View();
        }
        public ActionResult Sil(int id)
        {
            var ktg = ctx.Kategoriler.Find(id);
            ctx.Kategoriler.Remove(ktg);
            ctx.SaveChanges();
            return RedirectToAction("Index");

        }

        public ActionResult Guncelle(int id)
        {
            var ktg = ctx.Kategoriler.Find(id);
            return View("Guncelle", ktg);
        }

        public ActionResult Guncelle(Kategoriler u)
        {
            var ktg = ctx.Kategoriler.Find(u.KategoriID);
            ktg.KategoriID = u.KategoriID;
            ktg.KategoriAd = u.KategoriAd;
            ctx.SaveChanges();
            return RedirectToAction("Index");
        }


    }
}