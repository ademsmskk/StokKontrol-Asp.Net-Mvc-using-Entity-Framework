using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StokKontrolMvc.Models.Entity;

namespace StokKontrolMvc.Controllers
{
    public class UrunController : Controller
    {
        StokTakipEntities ctx = new StokTakipEntities();
        // GET: Urun
        public ActionResult Index()
        {
            var degerler = ctx.Urunler.ToList();
            
            return View(degerler);
        }

        public ActionResult UrunEkle()
        {
            ViewBag.Kategoriler = ctx.Kategoriler.ToList();
            ViewBag.Musteriler = ctx.Musteriler.ToList();
            return View();

        }

        [HttpPost]
        public ActionResult UrunEkle(Urunler u)
        {
            ctx.Urunler.Add(u);
            ctx.SaveChanges();
            return View();
        }

        public ActionResult Sil(int id)
        {
            var urun = ctx.Urunler.Find(id);
            ctx.Urunler.Remove(urun);
            ctx.SaveChanges();
            return RedirectToAction("Index");
        }

     
        public ActionResult Guncelle(int id)
        {
            var urun = ctx.Urunler.Find(id);

            return View("Guncelle",urun);
        }
     
        public ActionResult UrunGuncelle(Urunler p1)
        {
            var urun = ctx.Urunler.Find(p1.UrunID);
            urun.UrunID = p1.UrunID;
            urun.UrunAd = p1.UrunAd;
            urun.UrunKategori = p1.UrunKategori;
            urun.Fiyat = p1.Fiyat;
            urun.Stok = p1.Stok;
            ctx.SaveChanges();

            return RedirectToAction("Index");
        }

    }
    
    



}