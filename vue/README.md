# vue-project

## Vuejs (csr)

* プロジェクト作成
```
npm init vite@latest
```

* プロジェクト名と、vue(javascript)を選択する場合
```
npm init vite@latest vue-csr -- --template vue
```

## Nuxt (csr, ssr, ssg)

* プロジェクト作成
```
npx nuxi@latest init nuxt-app
```

* ビルド (csr, ssr)
```
npx nuxi build

//実行
node .output/server/index.mjs
```

* generate (ssg)
```
npx nuxi generate
```