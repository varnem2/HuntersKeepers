<template>
  <section id="hunter-ratings">
    <b-collapse
      v-for="(rating_attrs, rating) in ratings"
      class="card"
      :open.sync="rating_attrs.isOpen"
      :key="rating"
    >
      <div slot="trigger" slot-scope="props" class="card-header" role="button">
        <p class="card-header-title">{{rating.toUpperCase() + ': ' + rating_attrs.value}}</p>
        <div class="card-header-title" v-for="move in rating_attrs.moves.slice(0, 3)">
          <b-button
            v-show="!rating_attrs.isOpen"
            @click.stop="roll(move)"
            size="is-small"
            type="is-primary"
          >{{move.name}}</b-button>
        </div>
        <a class="card-header-icon">
          <b-icon :icon="rating_attrs.isOpen ? 'menu-down' : 'menu-up'"></b-icon>
        </a>
      </div>
      <div class="card-content">
        <div class="content">
          <div v-for="move in rating_attrs.moves">
            <div class="level">
              {{move.name}}
              <b-button @click="roll(move)" type="is-primary">Roll</b-button>
            </div>
            <p>{{move.description}}</p>
            <br />
          </div>
        </div>
      </div>
    </b-collapse>
  </section>
</template>

<script>
export default {
  data: function() {
    return {
      ratings: {
        charm: {
          isOpen: false,
          moves: [],
          value: 0
        },
        cool: {
          isOpen: false,
          moves: [],
          value: 0
        },
        sharp: {
          isOpen: false,
          moves: [],
          value: 0
        },
        tough: {
          isOpen: false,
          moves: [],
          value: 0
        },
        weird: {
          isOpen: false,
          moves: [],
          value: 0
        }
      },
      isSharpOpen: false
    };
  },
  methods: {
    roll(move) {
      fetch(`/moves/${move.id}.json?hunter_id=${this.hunter_id}`)
        .then(response => response.json())
        .then(move_resp => {
          this.$buefy.dialog.alert({
            title: move.name,
            message: move_resp["results"],
            confirmText: "Ok"
          });
        });
    }
  },
  mounted: function() {
    fetch(`/hunters/${this.hunter_id}.json`)
      .then(response => response.json())
      .then(hunter => {
        Object.keys(this.ratings).forEach(rating => {
          this.ratings[rating].value = hunter[rating];
        });
      });
    fetch(`/moves.json?basic=true`)
      .then(response => response.json())
      .then(moves => {
        moves.forEach(move => {
          this.ratings[move.rating]["moves"].push(move);
        });
      });
  },
  props: ["hunter_id"]
};
</script>
